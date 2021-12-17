
package com.iviettech.pr38_jv44_flight_booking.entities;

import com.iviettech.pr38_jv44_flight_booking.enums.FlightsStatusEnum;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "flights")     
public class FlightsEntity implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @Transient
    private String departStr;
    
    @Transient
    private String arrivalStr;
    
    @Transient
    private String trip;
    
     @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    private Date depart;
    
    @Temporal(TemporalType.TIMESTAMP)
     @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    private Date arrival;
    
    @Enumerated(EnumType.STRING)
    private FlightsStatusEnum status;
    
    @ManyToOne
    @JoinColumn(name = "operation_id")
    private OperationsEntity operation;
    
    @OneToMany(mappedBy = "flight")
    private List<BookingDetailEntity> bookingDetails;
    
    @OneToMany(mappedBy = "flight")
    private List<AircraftSeatsEntity> aricraftSeats;
    
    @ManyToOne
    @JoinColumn(name = "flight_route_id")
    private FlightRoutesEntity flightRoute;
    
    @ManyToOne
    @JoinColumn(name = "aircraft_id")
    private AircraftsEntity aircraft;
    
    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(name = "promotion_relationship",
            joinColumns = @JoinColumn(name = "flight_id",
                    referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(
                    name = "promotion_id",
                    referencedColumnName = "id"))
    private Set<PromotionEntity> promotions;
    
    @Transient
    private List<Integer> promotionIds;
    
    public FlightsEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDepart() {
        return depart;
    }

    public void setDepart(Date depart) {
        this.depart = depart;
    }

    public Date getArrival() {
        return arrival;
    }

    public void setArrival(Date arrival) {
        this.arrival = arrival;
    }

    public FlightsStatusEnum getStatus() {
        return status;
    }

    public void setStatus(FlightsStatusEnum status) {
        this.status = status;
    }

  

    public OperationsEntity getOperation() {
        return operation;
    }

    public void setOperation(OperationsEntity operation) {
        this.operation = operation;
    }

    public List<BookingDetailEntity> getBookingDetails() {
        return bookingDetails;
    }

    public void setBookingDetails(List<BookingDetailEntity> bookingDetails) {
        this.bookingDetails = bookingDetails;
    }

    public List<AircraftSeatsEntity> getAricraftSeats() {
        return aricraftSeats;
    }

    public void setAricraftSeats(List<AircraftSeatsEntity> aricraftSeats) {
        this.aricraftSeats = aricraftSeats;
    }

    public AircraftsEntity getAircraft() {
        return aircraft;
    }

    public void setAircraft(AircraftsEntity aircraft) {
        this.aircraft = aircraft;
    }

    public FlightRoutesEntity getFlightRoute() {
        return flightRoute;
    }

    public void setFlightRoute(FlightRoutesEntity flightRoute) {
        this.flightRoute = flightRoute;
    }

    public String getDepartStr() {
        return departStr;
    }

    public void setDepartStr(String departStr) {
        this.departStr = departStr;
    }

    public String getArrivalStr() {
        return arrivalStr;
    }

    public void setArrivalStr(String arrivalStr) {
        this.arrivalStr = arrivalStr;
    }

    public String getTrip() {
        return trip;
    }

    public void setTrip(String trip) {
        this.trip = trip;
    }

    public Set<PromotionEntity> getPromotions() {
        return promotions;
    }

    public void setPromotions(Set<PromotionEntity> promotions) {
        this.promotions = promotions;
    }

    public List<Integer> getPromotionIds() {
        return promotionIds;
    }

    public void setPromotionIds(List<Integer> promotionIds) {
        this.promotionIds = promotionIds;
    }
    
    
    
    
    
    
}
