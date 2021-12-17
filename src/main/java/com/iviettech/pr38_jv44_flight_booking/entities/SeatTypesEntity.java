/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.pr38_jv44_flight_booking.entities;

import com.iviettech.pr38_jv44_flight_booking.enums.SeatTypeEnum;
import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "seat_type")
public class SeatTypesEntity implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
     @Enumerated(EnumType.STRING)
    @Column(name = "seat_type", length = 10)
    private SeatTypeEnum seatType;
    
    @OneToMany(mappedBy = "seatType")
    private List<AircraftSeatsEntity> aircraftSeats;
   
    public SeatTypesEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public SeatTypeEnum getSeatType() {
        return seatType;
    }

    public void setSeatType(SeatTypeEnum seatType) {
        this.seatType = seatType;
    }

    public List<AircraftSeatsEntity> getAircraftSeats() {
        return aircraftSeats;
    }

    public void setAircraftSeats(List<AircraftSeatsEntity> aircraftSeats) {
        this.aircraftSeats = aircraftSeats;
    }


}
