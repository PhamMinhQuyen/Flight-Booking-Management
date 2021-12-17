/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.pr38_jv44_flight_booking.repository;

import com.iviettech.pr38_jv44_flight_booking.entities.ServiceBookingEntity;
import com.iviettech.pr38_jv44_flight_booking.entities.ServiceEntity;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ADMIN
 */
@Repository
public interface ServiceRepository extends CrudRepository<ServiceEntity, Integer>{

    public Page<ServiceEntity> findAll(Pageable pageable);
    
    
   
}
