/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.pr38_jv44_flight_booking.controller.management;

import com.iviettech.pr38_jv44_flight_booking.entities.AirportsEntity;
import com.iviettech.pr38_jv44_flight_booking.entities.BookingDetailEntity;
import com.iviettech.pr38_jv44_flight_booking.entities.BookingEntity;
import com.iviettech.pr38_jv44_flight_booking.entities.FlightRoutesEntity;
import com.iviettech.pr38_jv44_flight_booking.entities.ServiceBookingEntity;
import com.iviettech.pr38_jv44_flight_booking.entities.ServiceEntity;
import com.iviettech.pr38_jv44_flight_booking.service.AirportService;
import com.iviettech.pr38_jv44_flight_booking.service.BookingDetailService;
import com.iviettech.pr38_jv44_flight_booking.service.BookingService;
import com.iviettech.pr38_jv44_flight_booking.service.FlightRoutesService;
import com.iviettech.pr38_jv44_flight_booking.service.ServiceBookingService;
import com.iviettech.pr38_jv44_flight_booking.service.ServiceService;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import javax.ws.rs.PathParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

/**
 *
 * @author ADMIN
 */
@Controller
public class AjaxController {

    @Autowired
    private FlightRoutesService flightRoutesService;

    @Autowired
    private AirportService airportService;

    @Autowired
    private ServiceService serviceService;

    @Autowired
    private BookingDetailService bookingDetailService;

    @Autowired
    private BookingService bookingService;

    @Autowired
    private ServiceBookingService serviceBookingService;

    @RequestMapping(value = {"/api-load-fligt-routes"}, method = RequestMethod.GET)
    public String welcomePage(Model model,
            @PathParam("departureId") int departureId) {

        List<AirportsEntity> getDestination = airportService.getAirports();
        Map<Integer, String> getAirpotrts = new HashMap<Integer, String>();
        for (AirportsEntity airport : getDestination) {
            getAirpotrts.put(airport.getId(), airport.getCity().getName());
        }

        AirportsEntity airports = airportService.findById(departureId);
        getAirpotrts.remove(airports.getId(), airports.getCity().getName());

        model.addAttribute("getAirpotrts", getAirpotrts);
        return "manager/ajax/load-fligt-routes";

    }

    @RequestMapping(value = {"/api-change-price"}, method = RequestMethod.GET)
    @ResponseBody
    public String priceService(Model model, HttpSession session,
            @PathParam("quantity") int quantity,
            @PathParam("serviceId") int serviceId,
            @SessionAttribute("serviceBooking") HashMap<Integer, ServiceBookingEntity> serviceBookings
    ) {
        ServiceEntity service = serviceService.getServiceById(serviceId);
        if (quantity > 0) {
            boolean check = true;
            if (serviceBookings.size() > 0) {
                for (Map.Entry<Integer, ServiceBookingEntity> entry : serviceBookings.entrySet()) {

                    if (entry.getKey() == serviceId) {
                        ServiceBookingEntity serviceBooking = serviceBookings.get(entry.getKey());
                        serviceBooking.setQuantity(quantity);
                        serviceBooking.setPrice(service.getPrice());
                        serviceBookings.put(entry.getKey(), serviceBooking);
                        check = true;
                        break;
                    } else {

                        check = false;
                    }
                }
                if (check == false) {

                    ServiceBookingEntity serviceBookingLoop = new ServiceBookingEntity();
                    serviceBookingLoop.setService(service);
                    serviceBookingLoop.setQuantity(quantity);
                    serviceBookingLoop.setPrice(service.getPrice());
                    serviceBookings.put(serviceId, serviceBookingLoop);
                }
            } else {

                ServiceBookingEntity serviceBooking = new ServiceBookingEntity();
                serviceBooking.setService(service);
                serviceBooking.setQuantity(quantity);
                serviceBooking.setPrice(service.getPrice());
                serviceBookings.put(serviceId, serviceBooking);
            }

        } else {
            serviceBookings.remove(serviceId);

        }
        double totalServiceOfBookingDetail = 0;
        for (Map.Entry<Integer, ServiceBookingEntity> entry : serviceBookings.entrySet()) {
            totalServiceOfBookingDetail += entry.getValue().getPrice() * entry.getValue().getQuantity();
            
        }
        model.addAttribute("totalServiceOfBookingDetail", totalServiceOfBookingDetail);
        DecimalFormat formatter = new DecimalFormat("###,###,### VND");
        String price = formatter.format(totalServiceOfBookingDetail);
        return price;
    }

    @RequestMapping(value = {"/api-load-service"}, method = RequestMethod.GET)
    public String welcomePage(Model model, @PathParam("bookingDetailId") int bookingDetailId,
            @PathParam("bookingId") int bookingId,
            @SessionAttribute("serviceBooking") HashMap<Integer, ServiceBookingEntity> serviceBookings) {

        Collection<ServiceBookingEntity> values = serviceBookings.values();
        List<ServiceBookingEntity> serviceBooking = new ArrayList<ServiceBookingEntity>(values);
        BookingDetailEntity bookingdetail = bookingDetailService.getBookingDetailById(bookingDetailId);
        for (ServiceBookingEntity serviceB : serviceBooking) {
            serviceB.setBookingDetail(bookingdetail);
        }
        bookingdetail.setServiceBookings(serviceBooking);
       // serviceBookingService.saveAll(listServiceBookings);
        bookingDetailService.save(bookingdetail);

        List<BookingDetailEntity> bookingDetails = bookingDetailService.getBookingDetailByBookingId(bookingId);
        model.addAttribute("bookingDetails", bookingDetails);
        model.addAttribute("services", serviceService.getServices());
        BookingEntity booking = bookingService.getBookingById(bookingId);
        model.addAttribute("booking", booking);
        return "manager/ajax/load-service";
        //  return "redirect:/manager/booking-detail/" +bookingId;
    }

}
