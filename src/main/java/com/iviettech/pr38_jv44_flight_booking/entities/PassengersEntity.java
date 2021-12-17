
package com.iviettech.pr38_jv44_flight_booking.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "passenger")
public class PassengersEntity extends Persional implements Serializable{
    
    @Column(name = "iden_code")
    private String idenCode;
    
    @OneToMany(mappedBy = "passenger", cascade = CascadeType.ALL)
    private List<BookingDetailEntity> bookingDetail;
    
    public PassengersEntity() {
    }

    public String getIdenCode() {
        return idenCode;
    }

    public void setIdenCode(String idenCode) {
        this.idenCode = idenCode;
    }

    public List<BookingDetailEntity> getBookingDetail() {
        return bookingDetail;
    }

    public void setBookingDetail(List<BookingDetailEntity> bookingDetail) {
        this.bookingDetail = bookingDetail;
    }
    
    
}
