/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.pr38_jv44_flight_booking.controller.management;

import com.iviettech.pr38_jv44_flight_booking.entities.AirportsEntity;
import com.iviettech.pr38_jv44_flight_booking.entities.CityEntity;
import com.iviettech.pr38_jv44_flight_booking.entities.CountryEntity;
import com.iviettech.pr38_jv44_flight_booking.entities.ImageEntity;
import com.iviettech.pr38_jv44_flight_booking.enums.GeneralStatusEnum;
import com.iviettech.pr38_jv44_flight_booking.service.AirportService;
import com.iviettech.pr38_jv44_flight_booking.service.CityService;
import com.iviettech.pr38_jv44_flight_booking.service.CountryService;
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
public class AirportController {

    @Autowired
    private AirportService airportService;

    @Autowired
    private CountryService countryService;

    @Autowired
    private CityService cityService;

    @Autowired
    private ImageService imageService;

    @Autowired
    private ServletContext servletContext;

    @RequestMapping(value = {"/airportses"}, method = RequestMethod.GET)
    public String getAirports(Model model,
              @RequestParam("page") Optional<Integer> p) {
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        model.addAttribute("airportses", airportService.getAirportsPage(pageable));
        model.addAttribute("images", imageService.getImages());
        return "manager/list-airports";
    }

    @RequestMapping(value = {"/add-airports"}, method = RequestMethod.GET)
    public String airportsPage(Model model) {

        List<CountryEntity> countries = countryService.getCountries();
        String nameCountry = countries.get(0).getName(); // VietNam

        List<CityEntity> cities = cityService.getCities(nameCountry);
        String nameCity = cities.get(0).getName(); // QuangNam

        model.addAttribute("statusAirports", GeneralStatusEnum.values());
        model.addAttribute("countries", countries);
        model.addAttribute("cities", cities);
        model.addAttribute("airports", new AirportsEntity());
        model.addAttribute("action", "add");
        return "manager/airports";
    }

    @RequestMapping(value = "/result1", method = RequestMethod.POST)
    public String result(Model model,
            @ModelAttribute("airports") AirportsEntity airports,
            MultipartFile[] files, HttpServletRequest request) {
        List<ImageEntity> images = new ArrayList<ImageEntity>();
        for (int i = 0; i < files.length; i++) {
            MultipartFile file = files[i];
            try {

                byte[] bytes = file.getBytes();

                ServletContext context = request.getServletContext();
                String pathUrl = context.getRealPath("/images");

                int index = pathUrl.indexOf("target");
                String pathFolder = pathUrl.substring(0, index) + "src\\main\\webapp\\resources-management\\assets\\img\\airport\\";
                Path path = Paths.get(pathFolder + file.getOriginalFilename());
                Files.write(path, bytes);

                //get file name
                String name = file.getOriginalFilename();

                if (name == null) {
                    name = "new - image" + name;
                }
                ImageEntity image = new ImageEntity();
                image.setName(name);
                image.setAirport(airports);
                images.add(image);
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
        airports.setImages(images);
        airportService.save(airports);
        return "redirect:/manager/airportses";
    }

    @RequestMapping("/update-airports/{airportsId}")
    public String editAirports(Model model,
            @PathVariable("airportsId") int airportsId
    ) {
        List<CityEntity> cities = cityService.getCities(countryService.getCountries().get(0).getName());
        String city = cities.get(0).getName();
        model.addAttribute("airports", airportService.findById(airportsId));
        model.addAttribute("statusAirports", GeneralStatusEnum.values());
        model.addAttribute("countries", countryService.getCountries());
        model.addAttribute("cities", cities);
        model.addAttribute("action", "update");
        return "manager/airports";

    }

}
