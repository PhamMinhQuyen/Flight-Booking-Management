
package com.iviettech.pr38_jv44_flight_booking.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "aircraft_seats")
public class AircraftSeatsEntity implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    private double price;
    
    @ManyToOne
    @JoinColumn(name = "seat_type_id")
    private SeatTypesEntity seatType;
    
    @ManyToOne
    @JoinColumn(name = "seat_status_id")
    private SeatStatusEntity seatStatus;
    
    @ManyToOne
    @JoinColumn(name = "seat_id")
    private SeatsEntity seats;
    
    @ManyToOne
    @JoinColumn(name = "flight_id")
    private FlightsEntity flight;
    
    @ManyToOne
    @JoinColumn(name = "aircraft_id")
    private AircraftsEntity aircraft;
   
    public AircraftSeatsEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public SeatTypesEntity getSeatType() {
        return seatType;
    }

    public void setSeatType(SeatTypesEntity seatType) {
        this.seatType = seatType;
    }

    public SeatStatusEntity getSeatStatus() {
        return seatStatus;
    }

    public void setSeatStatus(SeatStatusEntity seatStatus) {
        this.seatStatus = seatStatus;
    }

    public SeatsEntity getSeats() {
        return seats;
    }

    public void setSeats(SeatsEntity seats) {
        this.seats = seats;
    }

    public FlightsEntity getFlight() {
        return flight;
    }

    public void setFlight(FlightsEntity flight) {
        this.flight = flight;
    }

    public AircraftsEntity getAircraft() {
        return aircraft;
    }

    public void setAircraft(AircraftsEntity aircraft) {
        this.aircraft = aircraft;
    }

   
}
