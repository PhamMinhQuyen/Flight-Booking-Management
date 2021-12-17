/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.pr38_jv44_flight_booking.service;

import com.iviettech.pr38_jv44_flight_booking.entities.AircraftsEntity;
import com.iviettech.pr38_jv44_flight_booking.repository.AircraftsRepository;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author ADMIN
 */
@Service
public class AircraftsService {

    @Autowired
    private AircraftsRepository aircraftsRepository;

     public List<AircraftsEntity> getAircrafts() {
        return (List<AircraftsEntity>) aircraftsRepository.findAll();
    }

    public Page<AircraftsEntity> getAircraftsPage(Pageable pageable) {
        return aircraftsRepository.findAll(pageable);
    }

    public void save(AircraftsEntity aircraftsEntity) {
        aircraftsRepository.save(aircraftsEntity);
    }

    public AircraftsEntity findById(int id) {
        Optional<AircraftsEntity> optional = aircraftsRepository.findById(id);
        if (optional.isPresent()) {
            return optional.get();
        }
        return new AircraftsEntity();
    }

   

}
