/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.pr38_jv44_flight_booking.controller.management;

import com.iviettech.pr38_jv44_flight_booking.entities.FlightsEntity;
import com.iviettech.pr38_jv44_flight_booking.enums.FlightsStatusEnum;
import com.iviettech.pr38_jv44_flight_booking.service.AircraftsService;
import com.iviettech.pr38_jv44_flight_booking.service.FlightRoutesService;
import com.iviettech.pr38_jv44_flight_booking.service.FlightsService;
import com.iviettech.pr38_jv44_flight_booking.service.OperationsService;
import com.iviettech.pr38_jv44_flight_booking.service.PromotionService;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import javax.servlet.http.HttpSession;
import javax.ws.rs.GET;
import javax.ws.rs.PathParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ADMIN
 */
@Controller
@RequestMapping(value = "/manager")
public class FlightsController {

    @Autowired
    private FlightsService flightsService;

    @Autowired
    private FlightRoutesService flightRoutesService;

    @Autowired
    private AircraftsService aircraftsService;

    @Autowired
    private OperationsService operationsService;

    @Autowired
    private PromotionService promotionService;

    @RequestMapping(value = {"/flightses"}, method = RequestMethod.GET)
    public String getFlightses(Model model,
            @RequestParam("page") Optional<Integer> p) {
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        model.addAttribute("flightses", flightsService.getFlightsPage(pageable));
        return "/manager/list-flightses";
    }

    @RequestMapping(value = {"/add-flights"}, method = RequestMethod.GET)
    public String airportsPage(Model model) {

        model.addAttribute("flightRouteses", flightRoutesService.getFlightRouteses());
        model.addAttribute("aircraftses", aircraftsService.getAircrafts());
        model.addAttribute("operationses", operationsService.getOperationses());
        model.addAttribute("promotions", promotionService.getPromotions());
        model.addAttribute("statusFlights", FlightsStatusEnum.values());
        model.addAttribute("flights", new FlightsEntity());
        model.addAttribute("action", "add");
        return "manager/flights";
    }

    @RequestMapping(value = {"/resultFlights"}, method = RequestMethod.POST)
    public String resultFlights(Model model,
            @ModelAttribute("flights") FlightsEntity flights,
            @PathParam("departStr") String departStr,
            @PathParam("arrivalStr") String arrivalStr
    ) {
        try {
            //  model.addAttribute("departStr", departStr);
            DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm");
            Date date = (Date) formatter.parse(departStr);
            Date date1 = (Date) formatter.parse(arrivalStr);
            flights.setDepart(date);
            flights.setArrival(date1);
            flightsService.save(flights);

            return "redirect:/manager/flightses";
            //    return "/manager/test";
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    @RequestMapping(value = {"/update-flights/{flightsId}"}, method = RequestMethod.GET)
    public String editFlightRoutes(Model model,
            @PathVariable("flightsId") int flightsId
    ) {

        model.addAttribute("flights", flightsService.geFlightsById(flightsId));
        model.addAttribute("aircraftses", aircraftsService.getAircrafts());
        model.addAttribute("flightRouteses", flightRoutesService.getFlightRouteses());
        model.addAttribute("operationses", operationsService.getOperationses());
        model.addAttribute("promotions", promotionService.getPromotions());
        model.addAttribute("statusFlights", FlightsStatusEnum.values());
        model.addAttribute("action", "update");
        return "manager/flights";

    }
}
