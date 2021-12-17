/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.pr38_jv44_flight_booking.controller.management;

import com.iviettech.pr38_jv44_flight_booking.entities.ImageEntity;
import com.iviettech.pr38_jv44_flight_booking.entities.ServiceEntity;
import com.iviettech.pr38_jv44_flight_booking.enums.GeneralStatusEnum;
import com.iviettech.pr38_jv44_flight_booking.service.ImageService;
import com.iviettech.pr38_jv44_flight_booking.service.ServiceService;
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
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
public class ServiceController {

    @Autowired
    private ServiceService serviceService;

    @Autowired
    private ImageService imageService;

    @RequestMapping(value = {"/services"}, method = RequestMethod.GET)
    public String getAirports(Model model,
            @RequestParam("page") Optional<Integer> p) {
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        model.addAttribute("services", serviceService.getServicesPage(pageable));
        model.addAttribute("images", imageService.getImages());
        return "manager/list-service";
    }

    @RequestMapping(value = {"/add-service"}, method = RequestMethod.GET)
    public String welcomePage(Model model) {
        model.addAttribute("service", new ServiceEntity());
        model.addAttribute("statusService", GeneralStatusEnum.values());
        model.addAttribute("action", "add");
        return "manager/service";
    }

    @RequestMapping(value = "/service/result", method = RequestMethod.POST)
    public String resultService(Model model,
            @ModelAttribute("service") ServiceEntity service,
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
                String pathFolder = pathUrl.substring(0, index) + "src\\main\\webapp\\resources-management\\assets\\img\\service\\";
                Path path = Paths.get(pathFolder + file.getOriginalFilename());
                Files.write(path, bytes);

                //get file name
                String name = file.getOriginalFilename();

                if (name == null) {
                    name = "new - image" + name;
                }
                ImageEntity image = new ImageEntity();
                image.setName(name);
                image.setService(service);
                images.add(image);
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
        service.setImages(images);
        serviceService.save(service);
        return "redirect:/manager/services";

    }

    @RequestMapping("/update-service/{serviceId}")
    public String editAircrafts(Model model,
            @PathVariable("serviceId") int serviceId
    ) {
        model.addAttribute("service", serviceService.getServiceById(serviceId));
        // model.addAttribute("images", imageService.getImages());
        model.addAttribute("statusService", GeneralStatusEnum.values());
        model.addAttribute("action", "update");
        return "manager/service";

    }
}
