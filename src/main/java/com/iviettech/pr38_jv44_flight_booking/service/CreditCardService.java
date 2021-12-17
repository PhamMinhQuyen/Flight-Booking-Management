/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.pr38_jv44_flight_booking.service;

import com.iviettech.pr38_jv44_flight_booking.entities.CreditCardEntity;
import com.iviettech.pr38_jv44_flight_booking.repository.CreditCardRepository;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ADMIN
 */
@Service
public class CreditCardService {
    
    @Autowired
    private CreditCardRepository creditCardRepository;
    
    public CreditCardEntity getCreditCardByPaymentId(int id)
    {
        Optional optional = creditCardRepository.findById(id);
        if(optional.isPresent()){
            return (CreditCardEntity) optional.get();
        } 
        return null;
    }
    
    public void save(CreditCardEntity creditCardEntity) {
         creditCardRepository.save(creditCardEntity);
    }
}
