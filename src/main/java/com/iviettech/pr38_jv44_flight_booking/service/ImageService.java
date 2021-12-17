/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.pr38_jv44_flight_booking.service;

import com.iviettech.pr38_jv44_flight_booking.entities.AircraftsEntity;
import com.iviettech.pr38_jv44_flight_booking.entities.ImageEntity;
import com.iviettech.pr38_jv44_flight_booking.repository.ImageRepository;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author ADMIN
 */
@Service
public class ImageService {

    @Autowired
    private ServletContext servletContext;

    @Autowired
    private ImageRepository imageRepository;

    public void saveImages(List<ImageEntity> images) {
        imageRepository.saveAll(images);
    }

    public List<ImageEntity> getImages() {
        return (List<ImageEntity>) imageRepository.findAll();
    }

    public List<ImageEntity> getNameImages(AircraftsEntity aircrafts) {
        List<MultipartFile> files = aircrafts.getMultipartFiles();
        List<ImageEntity> imageNames = new ArrayList<ImageEntity>();
        if (null != files && files.size() > 0) {
            for (MultipartFile multipartFile : files) {
                ImageEntity imageName = new ImageEntity();
                imageName.setName(multipartFile.getOriginalFilename());
                imageName.setAircraft(aircrafts);
                imageNames.add(imageName);
                File imageFile = new File(servletContext.getRealPath("/resources-management/assets/img"), multipartFile.getOriginalFilename());
                try {
                    multipartFile.transferTo(imageFile);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return imageNames;
    }

    public List<ImageEntity> getImageByAircraftId(int id) {
        return imageRepository.findByAircraft_Id(id);
    }

    public ImageEntity getImage(int imageId) {
        Optional<ImageEntity> optional = imageRepository.findById(imageId);
        if (optional.isPresent()) {
            return optional.get();
        }
        return null;
    }
    
    public void deleteImage(int imageId) {
        imageRepository.deleteByImageId(imageId);
    }
    
    public List<ImageEntity> getImageByAirportId(int id) {
        return imageRepository.findByAirport_Id(id);
    }
    
    
    public List<String> getName(ImageEntity imageEntity,List<MultipartFile> files) {
        List<String> imageNames = new ArrayList<String>();
            for (MultipartFile multipartFile : files) {
                String imageName = multipartFile.getOriginalFilename();
                imageNames.add(imageName);
               File imageFile = new File(servletContext.getRealPath("/resources-management/assets/img/aircrafts"),imageName);
                try {
                    multipartFile.transferTo(imageFile);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        return imageNames;
    }
    
//    public List<String> getName(ImageEntity imageEntity,MultipartFile[] files) {
//        List<String> imageNames = new ArrayList<String>();
//            for (MultipartFile multipartFile : files) {
//                String imageName = multipartFile.getOriginalFilename();
//                imageNames.add(imageName);
//                File imageFile = new File(servletContext.getRealPath("/resources-management/assets/img/aircrafts"),imageName);
//                try {
//                    multipartFile.transferTo(imageFile);
//                } catch (IOException e) {
//                    e.printStackTrace();
//                }
//            }
//        return imageNames;
//    }
    
    
    public void saveImage(ImageEntity image) {
        imageRepository.save(image);
    }
    
    
    public List<ImageEntity> getImageByServiceId(int id) {
        return imageRepository.findByService_Id(id);
    }
    
   
}
