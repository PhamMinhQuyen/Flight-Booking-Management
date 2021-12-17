/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.pr38_jv44_flight_booking.service;

import com.iviettech.pr38_jv44_flight_booking.entities.ServiceEntity;
import com.iviettech.pr38_jv44_flight_booking.repository.ServiceRepository;
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
public class ServiceService {
    
    @Autowired
    private ServiceRepository serviceRepository;
    
    public List<ServiceEntity> getServices(){
        return (List<ServiceEntity>) serviceRepository.findAll();
    }
    
  
    public void save(ServiceEntity promotionEntity) {
        serviceRepository.save(promotionEntity);
    }
    
    public ServiceEntity getServiceById(int id) {
        Optional<ServiceEntity> optional = serviceRepository.findById(id);
        if (optional.isPresent()) {
            return optional.get();
        }
        return new ServiceEntity();
    }
    
    public Page<ServiceEntity> getServicesPage(Pageable pageable ){
        return serviceRepository.findAll(pageable);
    }
    
    
}
