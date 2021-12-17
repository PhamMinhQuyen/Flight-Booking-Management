/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.pr38_jv44_flight_booking.repository;

import com.iviettech.pr38_jv44_flight_booking.entities.CityEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ADMIN
 */
@Repository
public interface CityRepository extends CrudRepository<CityEntity, Integer> {

    @Query(nativeQuery = true, value = "select *\n"
            + "from city as c\n"
            + "join country as co\n"
            + "on c.country_id=co.id\n"
            + "where co.name=?1")
    List<CityEntity> getCityByContry(String nameCountry);
    
}
