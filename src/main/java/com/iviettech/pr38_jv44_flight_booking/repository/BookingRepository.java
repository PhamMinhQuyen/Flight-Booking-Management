/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.pr38_jv44_flight_booking.repository;

import com.iviettech.pr38_jv44_flight_booking.entities.BookingEntity;
import java.util.Date;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 *
 * @author ADMIN
 */
@Repository
public interface BookingRepository extends CrudRepository<BookingEntity, Integer> {

    List<BookingEntity> findByBookingDateBetween(Date createDate, Date endDate);

    List<BookingEntity> findByFullNameContainingOrBookingNumber(String name, String number);

//    @Query(value = "SELECT * FROM booking b  WHERE  b.full_name like = ?1 or b.booking_number = ?2", nativeQuery = true)
//    List<BookingEntity> getBookingByFullNameOrBookingNumber(String name, String number);
    
    
    
}
