/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.pr38_jv44_flight_booking.service;

import com.iviettech.pr38_jv44_flight_booking.entities.AirportsEntity;
import com.iviettech.pr38_jv44_flight_booking.repository.AirportRepository;
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
public class AirportService {
    
    @Autowired
    private AirportRepository airportRepository;
    
    public List<AirportsEntity> getAirports() {
      return (List<AirportsEntity>) airportRepository.getNameCity();
    }
    
    public void save(AirportsEntity airportsEntity) {
        airportRepository.save(airportsEntity);
    }

    public AirportsEntity findById(int id) {
        Optional<AirportsEntity> optional = airportRepository.findById(id);
        if (optional.isPresent()) {
            return optional.get();
        }
        return new AirportsEntity();
    }
    
    public List<AirportsEntity> getNameCities(){
        return (List<AirportsEntity>) airportRepository.getNameCity();
    }
    
    public Page<AirportsEntity> getAirportsPage(Pageable pageable) {
        return airportRepository.findAll(pageable);
    }
}
