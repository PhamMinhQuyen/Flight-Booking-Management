/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.pr38_jv44_flight_booking.service;

import com.iviettech.pr38_jv44_flight_booking.entities.PaymentEntity;
import com.iviettech.pr38_jv44_flight_booking.repository.PaymentRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ADMIN
 */
@Service
public class PaymentService {
    
    @Autowired
    private PaymentRepository paymentRepository;
    
    public List<PaymentEntity> getPayments(){
        return (List<PaymentEntity>) paymentRepository.findAll();
    }
    
    public List<PaymentEntity> getPaymentByBookingId(int id){
        return paymentRepository.findByBooking_Id(id);
    }
}
