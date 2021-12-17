
package com.iviettech.pr38_jv44_flight_booking.entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;

@Entity
@Table(name = "payment")
public class PaymentEntity implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    private double amount;
    
    @Column(name = "payment_date")
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date paymentDate;
    
    @Column(length = 100)
    private String description;
    
    @ManyToOne
    @JoinColumn(name = "credit_card_id")
    private CreditCardEntity creditCart;
    
    @ManyToOne
    @JoinColumn(name = "booking_id")
    private BookingEntity booking;
    
    public PaymentEntity() {
    }
    
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public CreditCardEntity getCreditCart() {
        return creditCart;
    }

    public void setCreditCart(CreditCardEntity creditCart) {
        this.creditCart = creditCart;
    }

    public BookingEntity getBooking() {
        return booking;
    }

    public void setBooking(BookingEntity booking) {
        this.booking = booking;
    }
    
    
}
