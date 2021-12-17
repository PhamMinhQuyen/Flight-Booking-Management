/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.pr38_jv44_flight_booking.service;

import com.iviettech.pr38_jv44_flight_booking.entities.AircraftSeatsEntity;
import com.iviettech.pr38_jv44_flight_booking.entities.BookingDetailEntity;
import com.iviettech.pr38_jv44_flight_booking.entities.BookingEntity;
import com.iviettech.pr38_jv44_flight_booking.entities.ServiceBookingEntity;
import com.iviettech.pr38_jv44_flight_booking.repository.AircraftsSeatsRepository;
import com.iviettech.pr38_jv44_flight_booking.repository.BookingDetailRepository;
import com.iviettech.pr38_jv44_flight_booking.repository.BookingRepository;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

/**
 *
 * @author ADMIN
 */
@Service
public class BookingService {

    @Autowired
    private BookingRepository bookingRepository;

    @Autowired
    private BookingDetailService bookingDetailService;

    @Autowired
    private AircraftsSeatsService aircraftsSeatsService;

    @Autowired
    private ServiceBookingService serviceBookingService;

    public List<BookingEntity> getBookings() {
        return (List<BookingEntity>) bookingRepository.findAll();
    }

    public BookingEntity getBookingById(int id) {
        Optional<BookingEntity> optional = bookingRepository.findById(id);
        if (optional.isPresent()) {
            return optional.get();
        }
        return new BookingEntity();
    }

    public List<BookingEntity> searchBookingByBookingDate(Date startDate, Date endDate) {
        return bookingRepository.findByBookingDateBetween(startDate, endDate);
    }

    public List<BookingEntity> searchByNameOrBookingNumber(String name, String number) {
        return bookingRepository.findByFullNameContainingOrBookingNumber(name, number);

    }

    public List<BookingEntity> setTotalPrice(List<BookingEntity> bookings) {

        for (BookingEntity booking : bookings) {
            double totalPrice = 0;
            List<BookingDetailEntity> bookingDetails = bookingDetailService.getBookingDetailByBookingId(booking.getId());
            for (BookingDetailEntity bookingDetail : bookingDetails) {
                List<ServiceBookingEntity> serviceBookings = serviceBookingService.getServiceBookingsById(bookingDetail.getId());
                double totalServiceBookings = priceServiceBooking(serviceBookings);
                double priceFightRoutes = bookingDetail.getFlight().getFlightRoute().getSatandarPrice();
                AircraftSeatsEntity getPriceSeats = aircraftsSeatsService.getSeatPrice(bookingDetail.getFlight().getId(), bookingDetail.getSeat().getNumber());
                if (getPriceSeats != null) {
                    if (bookingDetail.getDiscount() > 0) {
                        if (serviceBookings.size() == 0) {
                            totalPrice +=  -  (priceFightRoutes+getPriceSeats.getPrice())* bookingDetail.getDiscount() / 100 ;
                        } else {
                            totalPrice += (priceFightRoutes+getPriceSeats.getPrice()) -  (priceFightRoutes+getPriceSeats.getPrice())* bookingDetail.getDiscount() / 100 + totalServiceBookings;
                        }
                    } else {
                        if (serviceBookings.size() == 0) {
                            totalPrice += priceFightRoutes+getPriceSeats.getPrice();
                        } else {
                            totalPrice += priceFightRoutes+getPriceSeats.getPrice() + totalServiceBookings;
                        }  
                    }
                }
            }
            booking.setTotalPrice(totalPrice);
            booking.setDirection(bookingDetailService.getDirection(bookingDetails));
        }

        return bookings;
    }

    public double priceServiceBooking(List<ServiceBookingEntity> serviceBookings) {
        double totalPrice = 0;
        for (ServiceBookingEntity serviceBooking : serviceBookings) {
            totalPrice += serviceBooking.getPrice() * serviceBooking.getQuantity();
        }
        return totalPrice;
    }

    public void save(BookingEntity bookingEntity) {
        bookingRepository.save(bookingEntity);
    }
    
    

}
