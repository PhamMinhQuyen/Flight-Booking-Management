
package com.iviettech.pr38_jv44_flight_booking.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "flight_routes")
public class FlightRoutesEntity implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @Temporal(javax.persistence.TemporalType.TIME)
    @DateTimeFormat(pattern = "HH:MI:SS")
    private Date duration;
    
    @Column(name = "satandar_price")
    private double satandarPrice;
    
    private int distance;
    
    @Column(length = 25)
    private String status;
    
    @ManyToOne
    @JoinColumn(name = "departure_id")
    private AirportsEntity departure;
    
    @ManyToOne
    @JoinColumn(name = "destination_id")
    private AirportsEntity destination;
    
    @OneToMany(mappedBy = "flightRoute")
    private List<FlightsEntity> flights;

    public FlightRoutesEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDuration() {
        return duration;
    }

    public void setDuration(Date duration) {
        this.duration = duration;
    }

    public double getSatandarPrice() {
        return satandarPrice;
    }

    public void setSatandarPrice(double satandarPrice) {
        this.satandarPrice = satandarPrice;
    }

    public int getDistance() {
        return distance;
    }

    public void setDistance(int distance) {
        this.distance = distance;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public AirportsEntity getDeparture() {
        return departure;
    }

    public void setDeparture(AirportsEntity departure) {
        this.departure = departure;
    }

    
  
    public AirportsEntity getDestination() {
        return destination;
    }

    public void setDestination(AirportsEntity destination) {
        this.destination = destination;
    }

    public List<FlightsEntity> getFlights() {
        return flights;
    }

    public void setFlights(List<FlightsEntity> flights) {
        this.flights = flights;
    }
    
    
    
}
