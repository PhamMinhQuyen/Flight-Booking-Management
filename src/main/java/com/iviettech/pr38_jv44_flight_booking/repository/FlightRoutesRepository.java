/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.pr38_jv44_flight_booking.repository;

import com.iviettech.pr38_jv44_flight_booking.entities.FlightRoutesEntity;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 *
 * @author ADMIN
 */
@Repository
public interface FlightRoutesRepository extends CrudRepository<FlightRoutesEntity, Integer>{
    
    List<FlightRoutesEntity> findByDeparture_Id(int id);
    
    public Page<FlightRoutesEntity> findAll(Pageable pageable);
    
}
