/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.pr38_jv44_flight_booking.controller.management;

import com.iviettech.pr38_jv44_flight_booking.entities.PromotionEntity;
import com.iviettech.pr38_jv44_flight_booking.enums.GeneralStatusEnum;
import com.iviettech.pr38_jv44_flight_booking.service.PromotionService;
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
public class PromotionController {
    
    @Autowired
    private PromotionService promotionService;
    
    @RequestMapping(value = {"/promotions"}, method = RequestMethod.GET)
    public String getAirports(Model model,
            @RequestParam("page") Optional<Integer> p) {
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        model.addAttribute("promotions", promotionService.getPromotionsPage(pageable));
        return "manager/list-promotion";
    }
    
    @RequestMapping(value = {"/add-promotion"}, method = RequestMethod.GET)
    public String addPromotion(Model model) {
        model.addAttribute("promotion", new PromotionEntity());
        model.addAttribute("statusPromotion", GeneralStatusEnum.values());
        model.addAttribute("action", "add");
        return "manager/promotion";
    }
    
    @RequestMapping(value = {"/resultPromotion"}, method = RequestMethod.POST)
    public String resultPromotion(Model model,
            @ModelAttribute("promotion") PromotionEntity promotion,
            @PathParam("createDateStr") String createDateStr,
            @PathParam("startDateStr") String startDateStr,
            @PathParam("endDateStr") String endDateStr
    ) {
        try {
            DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date date = sdf.parse(createDateStr);
            promotion.setCreateDate(date);
            
            Date date1 = sdf.parse(startDateStr);  
            promotion.setStartDate(date1);
            
            Date date2 = sdf.parse(endDateStr);  
            promotion.setEndDate(date2);
            
            promotionService.save(promotion);
           return "redirect:/manager/promotions";
          //   return "/manager/test";
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return null;
    }
    
      @RequestMapping( value = {"/update-promotion/{promotionId}"}, method = RequestMethod.GET)
    public String editFlightRoutes(Model model,
            @PathVariable("promotionId") int promotionId
    ) {
        
        model.addAttribute("promotion", promotionService.getPromotionById(promotionId));
         model.addAttribute("statusPromotion", GeneralStatusEnum.values());
        model.addAttribute("action", "update");
        return "manager/promotion";

    }
}
