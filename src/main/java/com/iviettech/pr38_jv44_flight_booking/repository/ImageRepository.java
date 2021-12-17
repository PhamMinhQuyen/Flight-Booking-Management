/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.pr38_jv44_flight_booking.repository;

import com.iviettech.pr38_jv44_flight_booking.entities.ImageEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author ADMIN
 */
@Repository
public interface ImageRepository extends CrudRepository<ImageEntity, Integer>{
    List<ImageEntity> findByAircraft_Id(int id);
    
    List<ImageEntity> findByAirport_Id(int id);
    
    List<ImageEntity> findByService_Id(int id);
    
    
    
   @Modifying 
   @Transactional
   @Query(nativeQuery = true, value = "delete from image i where i.id = :id")
   public void deleteByImageId(@Param("id") int id);
}
