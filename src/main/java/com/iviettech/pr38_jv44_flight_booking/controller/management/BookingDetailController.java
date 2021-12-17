/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.pr38_jv44_flight_booking.controller.management;

import com.iviettech.pr38_jv44_flight_booking.entities.BookingDetailEntity;
import com.iviettech.pr38_jv44_flight_booking.entities.BookingEntity;
import com.iviettech.pr38_jv44_flight_booking.entities.ServiceBookingEntity;
import com.iviettech.pr38_jv44_flight_booking.enums.BookingStatusEnum;
import com.iviettech.pr38_jv44_flight_booking.service.BookingDetailService;
import com.iviettech.pr38_jv44_flight_booking.service.BookingService;
import com.iviettech.pr38_jv44_flight_booking.service.ServiceService;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author ADMIN
 */
@Controller
@RequestMapping(value = "/manager")
public class BookingDetailController {

    @Autowired
    private BookingDetailService bookingDetaulService;

    @Autowired
    private BookingService bookingService;
    
     @Autowired
    private ServiceService serviceService;

    @RequestMapping(value = {"/booking-details"}, method = RequestMethod.GET)
    public String getBookingDetails(Model model) {
        model.addAttribute("bookingdetails", bookingDetaulService.getBookingDetails());
        return "manager/booking-details";
    }

    @RequestMapping(value = {"/booking-detail/{bookingId}"}, method = RequestMethod.GET)
    public String getBookingDetailByBooking(Model model,HttpSession session,
            @PathVariable("bookingId") int bookingId
    ) {
        session.setAttribute("serviceBooking", new HashMap<Integer, ServiceBookingEntity>());
        BookingEntity booking = bookingService.getBookingById(bookingId);
        model.addAttribute("status", BookingStatusEnum.values());
        if (booking.getBookingStatus().equals(BookingStatusEnum.CHECK_IN)) {
            Map<String, String> enums = new HashMap<String, String>();
            for (BookingStatusEnum bookingStatus : BookingStatusEnum.values()) {
                enums.put(bookingStatus.name(), bookingStatus.name());
            }
            enums.remove(BookingStatusEnum.CANCEL.name());
            enums.remove(BookingStatusEnum.BOOKED.name());
            model.addAttribute("enums", enums);
        }
        
        model.addAttribute("booking", booking);
        List<BookingDetailEntity> bookingDetails = bookingDetaulService.getBookingDetailByBookingId(bookingId);
        model.addAttribute("bookingDetails", bookingDetails);
        model.addAttribute("direction", bookingDetaulService.getDirection(bookingDetails));
        model.addAttribute("services", serviceService.getServices());
        return "manager/booking-details";

    }
    
   
}
