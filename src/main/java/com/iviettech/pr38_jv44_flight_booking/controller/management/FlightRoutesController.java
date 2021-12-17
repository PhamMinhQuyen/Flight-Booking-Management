/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.pr38_jv44_flight_booking.controller.management;

import com.iviettech.pr38_jv44_flight_booking.entities.FlightRoutesEntity;
import com.iviettech.pr38_jv44_flight_booking.service.AirportService;
import com.iviettech.pr38_jv44_flight_booking.service.FlightRoutesService;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;
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
public class FlightRoutesController {

    @Autowired
    private FlightRoutesService flightRoutesService;

    @Autowired
    private AirportService airportService;

    @RequestMapping(value = {"/flight-routes"}, method = RequestMethod.GET)
    public String getAircrafts(Model model,
            @RequestParam("page") Optional<Integer> p) {
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        model.addAttribute("flightRouteses", flightRoutesService.getFlightRoutesPage(pageable));
        return "manager/list-flight-routeses";
    }

    @RequestMapping(value = {"/add-flight-routes"}, method = RequestMethod.GET)
    public String flightRoutesPage(Model model) {
        model.addAttribute("airports", airportService.getNameCities());
        model.addAttribute("flightRoutes", new FlightRoutesEntity());
        model.addAttribute("action", "add");
        return "manager/flight-routes";
    }

    @RequestMapping(value = "/resultFlightRoutes", method = RequestMethod.POST)
    public String result(Model model,
            @ModelAttribute("flightRoutes") FlightRoutesEntity flightRoutes,
            @PathParam("durationStr") String durationStr
    ) {
        try {

            DateFormat sdf = new SimpleDateFormat("hh:mm");
            Date date = sdf.parse(durationStr);
            flightRoutes.setDuration(date);
            flightRoutesService.save(flightRoutes);
            return "redirect:/manager/flight-routes";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }

    @RequestMapping("/update-flight-routes/{flightRoutesId}")
    public String editFlightRoutes(Model model,
            @PathVariable("flightRoutesId") int flightRoutesId
    ) {
        model.addAttribute("airports", airportService.getNameCities());
        model.addAttribute("flightRoutes", flightRoutesService.getFlightRoutesById(flightRoutesId));
        model.addAttribute("action", "update");
        return "manager/flight-routes";

    }

}
