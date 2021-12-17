/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.pr38_jv44_flight_booking.service;

import com.iviettech.pr38_jv44_flight_booking.entities.BookingDetailEntity;
import com.iviettech.pr38_jv44_flight_booking.repository.BookingDetailRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ADMIN
 */
@Service
public class BookingDetailService {
    
    @Autowired
    private BookingDetailRepository bookingDetailRepository;
    
    public List<BookingDetailEntity> getBookingDetails(){
        return (List<BookingDetailEntity>) bookingDetailRepository.findAll();
    }
    
     public List<BookingDetailEntity> getBookingDetailByBookingId(int id){
         return bookingDetailRepository.findByBooking_Id(id);
     }
     
     public String getDirection(List<BookingDetailEntity> bookingDetails){
         if(bookingDetails.get(0).getFlight().getId()==bookingDetails.get(bookingDetails.size()-1).getFlight().getId()){
             return "OneTrip";
         } else {
              return "TwoTrip";
         }
     }
     
     public BookingDetailEntity getBookingDetailById(int id) {
        Optional<BookingDetailEntity> optional = bookingDetailRepository.findById(id);
        if (optional.isPresent()) {
            return optional.get();
        }
        return new BookingDetailEntity();
    }
     
     
    public void save(BookingDetailEntity bookingDetailEntity) {
        bookingDetailRepository.save(bookingDetailEntity);
    }
}
