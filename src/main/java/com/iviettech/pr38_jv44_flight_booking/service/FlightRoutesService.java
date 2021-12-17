/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.pr38_jv44_flight_booking.service;

import com.iviettech.pr38_jv44_flight_booking.entities.FlightRoutesEntity;
import com.iviettech.pr38_jv44_flight_booking.repository.FlightRoutesRepository;
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
public class FlightRoutesService {
    
    
    @Autowired
    private FlightRoutesRepository flightRoutesRepository;
    
    public List<FlightRoutesEntity> getFlightRouteses(){
        return (List<FlightRoutesEntity>) flightRoutesRepository.findAll();
    }
    
    public void save(FlightRoutesEntity flightRoutesEntity) {
        flightRoutesRepository.save(flightRoutesEntity);
    }
    
    public List<FlightRoutesEntity> getDestinationByDeparture(int id){
        return flightRoutesRepository.findByDeparture_Id(id);
    }
    
     public FlightRoutesEntity getFlightRoutesById(int id) {
        Optional<FlightRoutesEntity> optional = flightRoutesRepository.findById(id);
        if (optional.isPresent()) {
            return optional.get();
        }
        return new FlightRoutesEntity();
    }
     
     public Page<FlightRoutesEntity> getFlightRoutesPage(Pageable pageable) {
        return flightRoutesRepository.findAll(pageable);
    }

}
