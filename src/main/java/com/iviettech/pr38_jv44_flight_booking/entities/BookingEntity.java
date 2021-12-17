package com.iviettech.pr38_jv44_flight_booking.entities;

import com.iviettech.pr38_jv44_flight_booking.enums.BookingStatusEnum;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.Transient;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "booking")
public class BookingEntity extends Persional implements Serializable {

    @Column(name = "booking_date")
    @DateTimeFormat(pattern = "yyyy/MM/dd")
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date bookingDate;

    @Column(name = "booking_number")
    private String bookingNumber;

    @Enumerated(EnumType.STRING)
    @Column(name = "booking_status", length = 25)
    private BookingStatusEnum bookingStatus;

    @OneToMany(mappedBy = "booking", cascade = CascadeType.ALL)
    private List<BookingDetailEntity> bookingDetail;

    @OneToMany(mappedBy = "booking", cascade = CascadeType.ALL)
    private List<PaymentEntity> payments;

    @Transient
    private String direction;

    @Transient
    private double totalPrice;

    public BookingEntity() {
    }

    public Date getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }

    public String getBookingNumber() {
        return bookingNumber;
    }

    public void setBookingNumber(String bookingNumber) {
        this.bookingNumber = bookingNumber;
    }

    public BookingStatusEnum getBookingStatus() {
        return bookingStatus;
    }

    public void setBookingStatus(BookingStatusEnum bookingStatus) {
        this.bookingStatus = bookingStatus;
    }

    public List<BookingDetailEntity> getBookingDetail() {
        return bookingDetail;
    }

    public void setBookingDetail(List<BookingDetailEntity> bookingDetail) {
        this.bookingDetail = bookingDetail;
    }

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    public List<PaymentEntity> getPayments() {
        return payments;
    }

    public void setPayments(List<PaymentEntity> payments) {
        this.payments = payments;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

}
