
package com.iviettech.pr38_jv44_flight_booking.controller.management;

import com.iviettech.pr38_jv44_flight_booking.entities.AircraftsEntity;
import com.iviettech.pr38_jv44_flight_booking.entities.AirportsEntity;
import com.iviettech.pr38_jv44_flight_booking.entities.ImageEntity;
import com.iviettech.pr38_jv44_flight_booking.entities.ServiceEntity;
import com.iviettech.pr38_jv44_flight_booking.service.AircraftsService;
import com.iviettech.pr38_jv44_flight_booking.service.AirportService;
import com.iviettech.pr38_jv44_flight_booking.service.ImageService;
import com.iviettech.pr38_jv44_flight_booking.service.ServiceService;
import java.io.IOException;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author ADMIN
 */
@Controller
@RequestMapping(value = "/manager")
public class ListImagesController {

    @Autowired
    private AircraftsService aircraftsService;

    @Autowired
    private AirportService airportService;

    @Autowired
    private ImageService imageService;

    @Autowired
    private ServiceService serviceService;

    @RequestMapping(value = "/list-images-aircrafrs/{aircraftsId}", method = RequestMethod.GET)
    public String viewListImagesAircrafrs(Model model,
            @PathVariable("aircraftsId") int aircraftsId) {
        model.addAttribute("imagesAircrafrs", imageService.getImageByAircraftId(aircraftsId));
        model.addAttribute("object", "aircrafts");
        return "/manager/list-images";
    }

    @RequestMapping(value = {"/delete-image-aircrafts/{imgId}"}, method = RequestMethod.GET)
    public String deleteAircraftsImage(@PathVariable("imgId") int imgId) {
        int aircraftsId = imageService.getImage(imgId).getAircraft().getId();
        imageService.deleteImage(imgId);
        return "redirect:/manager/list-images-aircrafrs/" + aircraftsId;
    }

    @RequestMapping(value = {"/add-image-aircrafts/{aircraftsId}"}, method = RequestMethod.GET)
    public String addImageAircrafts(Model model,
            @PathVariable("aircraftsId") int aircraftsId) {
        AircraftsEntity aircrafts = aircraftsService.findById(aircraftsId);
        ImageEntity imageEntity = new ImageEntity();
        imageEntity.setAircraft(aircrafts);
        model.addAttribute("imageEntity", imageEntity);
        return "/manager/add-image-aircrafts";
    }

    @RequestMapping(value = {"/load-imgage-aircrafts/{aircraftsId}"}, method = RequestMethod.POST)
    public String upLoadImage(
            @PathVariable int aircraftsId,
            @ModelAttribute("imageEntity") ImageEntity imageEntity, MultipartFile[] files, HttpServletRequest request) {
        AircraftsEntity aircrafts = aircraftsService.findById(aircraftsId);
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
                imageService.saveImage(image);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return "redirect:/manager/list-images-aircrafrs/" + aircraftsId;
    }

    @RequestMapping(value = "/list-images-airport/{airportId}", method = RequestMethod.GET)
    public String viewListImages(Model model,
            @PathVariable("airportId") int airportId) {
        model.addAttribute("imagesAirport", imageService.getImageByAirportId(airportId));
        model.addAttribute("object", "airport");
        return "/manager/list-images";
    }

    @RequestMapping(value = {"/delete-image-airport/{imgId}"}, method = RequestMethod.GET)
    public String deleteAirportImage(@PathVariable("imgId") int imgId) {
        int airportId = imageService.getImage(imgId).getAirport().getId();
        imageService.deleteImage(imgId);
        return "redirect:/manager/list-images-airport/" + airportId;
    }

    @RequestMapping(value = {"/add-image-airport/{airportId}"}, method = RequestMethod.GET)
    public String addImageAirport(Model model,
            @PathVariable("airportId") int airportId) {
        AirportsEntity airports = airportService.findById(airportId);
        ImageEntity imageEntity = new ImageEntity();
        imageEntity.setAirport(airports);
        model.addAttribute("imageEntity", imageEntity);
        return "/manager/add-image-airport";
    }

    @RequestMapping(value = {"/load-imgage-airport/{airportId}"}, method = RequestMethod.POST)
    public String upLoad(
            @PathVariable int airportId,
            @ModelAttribute("imageEntity") ImageEntity imageEntity, MultipartFile[] files, HttpServletRequest request) {
        AirportsEntity airports = airportService.findById(airportId);
//        List<MultipartFile> files = imageEntity.getMultipartFiles();
//        if (null != files && files.size() > 0) {
//            List<String> imageNames = imageService.getName(imageEntity, files);
//            for (String imageName : imageNames) {
//                ImageEntity image = new ImageEntity();
//                image.setName(imageName);
//                image.setAirport(airports);
//                imageService.saveImage(image);
//            }
//        }
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
                imageService.saveImage(image);
            } catch (IOException e) {
                e.printStackTrace();
            }

            //  aircrafts.setImages(images);
            //  aircraftsService.save(aircrafts);
        }

        return "redirect:/manager/list-images-airport/" + airportId;
    }

    @RequestMapping(value = "/list-images-service/{serviceId}", method = RequestMethod.GET)
    public String viewListImagesService(Model model,
            @PathVariable("serviceId") int serviceId) {
        model.addAttribute("imagesService", imageService.getImageByServiceId(serviceId));
        model.addAttribute("object", "service");
        return "/manager/list-images";
    }

    @RequestMapping(value = {"/add-image-service/{serviceId}"}, method = RequestMethod.GET)
    public String addImageService(Model model,
            @PathVariable("serviceId") int serviceId) {
        ServiceEntity service = serviceService.getServiceById(serviceId);
        ImageEntity imageEntity = new ImageEntity();
        imageEntity.setService(service);
        model.addAttribute("imageEntity", imageEntity);
        return "/manager/add-image-service";
    }

    @RequestMapping(value = {"/load-imgage-service/{serviceId}"}, method = RequestMethod.POST)
    public String upLoadImageService(
            @PathVariable int serviceId,
            @ModelAttribute("imageEntity") ImageEntity imageEntity, MultipartFile[] files, HttpServletRequest request) {
        ServiceEntity service = serviceService.getServiceById(serviceId);
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
                imageService.saveImage(image);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return "redirect:/manager/list-images-service/" + serviceId;
    }

    @RequestMapping(value = {"/delete-image-service/{imgId}"}, method = RequestMethod.GET)
    public String deleteServiceImage(@PathVariable("imgId") int imgId) {
        int serviceId = imageService.getImage(imgId).getService().getId();
        imageService.deleteImage(imgId);
        return "redirect:/manager/list-images-service/" + serviceId;
    }

}
