/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.pr38_jv44_flight_booking.controller.management;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author ADMIN
 */

@Controller
@RequestMapping(value = "/manager")
      
public class HomeController {
    
    @RequestMapping(value = {"/","/home"}, method = RequestMethod.GET)
    public String welcomePage(Model model) {
        return "manager/home";
    }
    
    
}

