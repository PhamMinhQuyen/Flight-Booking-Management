/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.pr38_jv44_flight_booking.controller.management;

import com.iviettech.pr38_jv44_flight_booking.entities.AircraftsEntity;
import com.iviettech.pr38_jv44_flight_booking.entities.ImageEntity;
import com.iviettech.pr38_jv44_flight_booking.enums.GeneralStatusEnum;
import com.iviettech.pr38_jv44_flight_booking.service.AircraftsService;
import com.iviettech.pr38_jv44_flight_booking.service.ImageService;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author ADMIN
 */
@Controller
@RequestMapping(value = "/manager")
public class AircraftsController {

    @Autowired
    private AircraftsService aircraftsService;

    @Autowired
    private ServletContext servletContext;

    @Autowired
    private ImageService imageService;

   

    @RequestMapping(value = {"/aircrafts"}, method = RequestMethod.GET)
    public String getAircrafts(Model model,
            @RequestParam("page") Optional<Integer> p) {
         Pageable pageable = PageRequest.of(p.orElse(0), 4);
        model.addAttribute("aircraftses", aircraftsService.getAircraftsPage(pageable));
        model.addAttribute("images", imageService.getImages());
        return "manager/list-aircrafts";
    }

    @RequestMapping(value = {"/add-aircrafts"}, method = RequestMethod.GET)
    public String welcomePage(Model model) {
        model.addAttribute("aircrafts", new AircraftsEntity());
        model.addAttribute("statusAircrafts", GeneralStatusEnum.values());
        model.addAttribute("action", "add");
        return "manager/aircrafts";
    }

    @RequestMapping(value = "/result", method = RequestMethod.POST)
    public String resultAircrafts(Model model,
            @ModelAttribute("aircrafts") AircraftsEntity aircrafts,
            MultipartFile[] files, HttpServletRequest request
    ) {
        List<ImageEntity> images = new ArrayList<ImageEntity>();
        for (int i = 0; i < files.length; i++) {
            MultipartFile file = files[i];
            try {
                byte[] bytes = file.getBytes();
                ServletContext context = request.getServletContext();
                String pathUrl = context.getRealPath("/images");

                int index = pathUrl.indexOf("target");
                String pathFolder = pathUrl.substring(0, index) + "src\\main\\webapp\\resources-management\\assets\\img\\aircrafts\\";
                Path path = Paths.get(pathFolder + file.getOriginalFilename());
                Files.write(path, bytes);

                //get file name
                String name = file.getOriginalFilename();

                if (name == null) {
                    name = "new - image" + name;
                }
                ImageEntity image = new ImageEntity();
                image.setName(name);
                image.setAircraft(aircrafts);
                images.add(image);
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
        aircrafts.setImages(images);
        aircraftsService.save(aircrafts);
        return "redirect:/manager/aircrafts";

    }

    @RequestMapping("/update-aircrafts/{aircraftsId}")
    public String editAircrafts(Model model,
            @PathVariable("aircraftsId") int aircraftsId
    ) {
        model.addAttribute("aircrafts", aircraftsService.findById(aircraftsId));
        model.addAttribute("images", imageService.getImages());
        model.addAttribute("statusAircrafts", GeneralStatusEnum.values());
        model.addAttribute("action", "update");
        return "manager/aircrafts";

    }

}
