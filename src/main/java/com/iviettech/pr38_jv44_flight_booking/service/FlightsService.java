/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.pr38_jv44_flight_booking.service;

import com.iviettech.pr38_jv44_flight_booking.entities.FlightsEntity;
import com.iviettech.pr38_jv44_flight_booking.repository.FlightsRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

/**
 *
 * @author ADMIN
 */
@Service
public class FlightsService {
    
    @Autowired
    private FlightsRepository flightsRepository;
    
    public List<FlightsEntity> getFlightses(){
        return (List<FlightsEntity>) flightsRepository.findAll();
    }
    
    public void save(FlightsEntity flightsEntity) {
        flightsRepository.save(flightsEntity);
    }
    
     public FlightsEntity geFlightsById(int id) {
        Optional<FlightsEntity> optional = flightsRepository.findById(id);
        if (optional.isPresent()) {
            return optional.get();
        }
        return new FlightsEntity();
    }
     
     public Page<FlightsEntity> getFlightsPage(Pageable pageable) {
        return flightsRepository.findAll(pageable);
    }
}
