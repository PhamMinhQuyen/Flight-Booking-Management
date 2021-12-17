/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.pr38_jv44_flight_booking.service;

import com.iviettech.pr38_jv44_flight_booking.entities.OperationsEntity;
import com.iviettech.pr38_jv44_flight_booking.repository.OperationsRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ADMIN
 */
@Service
public class OperationsService {
    
    @Autowired
    private OperationsRepository operationsRepository;
    
    public List<OperationsEntity> getOperationses(){
        return (List<OperationsEntity>) operationsRepository.findAll();
    }
    
}
