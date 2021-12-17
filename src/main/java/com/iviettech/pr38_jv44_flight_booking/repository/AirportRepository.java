/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.pr38_jv44_flight_booking.repository;

import com.iviettech.pr38_jv44_flight_booking.entities.AirportsEntity;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ADMIN
 */
@Repository
public interface AirportRepository extends CrudRepository<AirportsEntity, Integer> {

    @Query(nativeQuery = true, value = "select *\n" 
            + "from airport as ai\n"
            + "join city as c\n"
            + "on ai.city_id=c.id\n"
            + "group by c.name")
    List<AirportsEntity> getNameCity();
    
    
    public Page<AirportsEntity> findAll(Pageable pageable);
}
