/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.pr38_jv44_flight_booking.controller.management;

import com.iviettech.pr38_jv44_flight_booking.entities.AircraftSeatsEntity;
import com.iviettech.pr38_jv44_flight_booking.entities.BookingDetailEntity;
import com.iviettech.pr38_jv44_flight_booking.entities.BookingEntity;
import com.iviettech.pr38_jv44_flight_booking.dto.BookingExcelExporter;
import com.iviettech.pr38_jv44_flight_booking.entities.CreditCardEntity;
import com.iviettech.pr38_jv44_flight_booking.entities.PaymentEntity;
import com.iviettech.pr38_jv44_flight_booking.entities.ServiceBookingEntity;
import com.iviettech.pr38_jv44_flight_booking.enums.BookingStatusEnum;
import com.iviettech.pr38_jv44_flight_booking.service.AircraftsSeatsService;
import com.iviettech.pr38_jv44_flight_booking.service.BookingDetailService;
import com.iviettech.pr38_jv44_flight_booking.service.BookingService;
import com.iviettech.pr38_jv44_flight_booking.service.CreditCardService;
import com.iviettech.pr38_jv44_flight_booking.service.PaymentService;
import java.io.IOException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.PathParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

/**
 *
 * @author ADMIN
 */
@Controller
@RequestMapping(value = "/manager")
public class BookingController {

    @Autowired
    private BookingService bookingService;

    @Autowired
    private PaymentService paymentService;

    @Autowired
    private BookingDetailService bookingDetailService;

    @Autowired
    private AircraftsSeatsService aircraftsSeatsService;

    @Autowired
    private CreditCardService creditCardService;

    //@Autowired thì @Bean sẻ gán vào biến mailSender;
    @Autowired
    MailSender mailSender;

    @RequestMapping(value = {"/bookings"}, method = RequestMethod.GET)
    public String getBookings(Model model,HttpSession session,
            @RequestParam("page") Optional<Integer> p) {
        List<BookingEntity> bookings = bookingService.getBookings();
        session.setAttribute("bookings", bookingService.setTotalPrice(bookings));
        return "manager/list-booking";
    }

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String searchBookingByNameOrBookingNumber(Model model,
            @ModelAttribute("strSearch") String strSearch
    ) {
        List<BookingEntity> bookings = bookingService.searchByNameOrBookingNumber(strSearch, strSearch);
        model.addAttribute("bookings", bookingService.setTotalPrice(bookings));
        return "manager/list-booking";
    }

    @RequestMapping(value = "/searchDate", method = RequestMethod.POST)
    public String searchBookingByBookingDate(Model model, HttpSession session,
            @ModelAttribute("startDate") String startDate,
            @ModelAttribute("endDate") String endDate
    ) {
        try {
            Date date = new SimpleDateFormat("yyyy-MM-dd").parse(startDate);
            Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(endDate);
            List<BookingEntity> bookings = bookingService.searchBookingByBookingDate(date, date1);

            session.setAttribute("bookings", bookingService.setTotalPrice(bookings));

            return "manager/list-booking";
        } catch (ParseException ex) {
            Logger.getLogger(BookingController.class.getName()).log(Level.SEVERE, null, ex);
            return "redirect:/manager/bookings";
        }
    }

    @RequestMapping(value = "/booking/result/{bookingId}", method = RequestMethod.POST)
    public String resultBooking(Model model,
            @PathParam("status") String status,
            @PathVariable("bookingId") int bookingId) {
        BookingEntity booking = bookingService.getBookingById(bookingId);
        booking.setBookingStatus(BookingStatusEnum.valueOf(status));
        if (status.equals(BookingStatusEnum.CANCEL.name())) {
            List<PaymentEntity> listPayments = paymentService.getPaymentByBookingId(bookingId);
            CreditCardEntity creditCard = listPayments.get(0).getCreditCart();
            List<BookingDetailEntity> bookingDetails = bookingDetailService.getBookingDetailByBookingId(bookingId);
            double totalUnitPrice = 0;
            double totalPriceService = 0;
            double totalPriceDiscount = 0;
            for (BookingDetailEntity bookingDetail : bookingDetails) {
                totalUnitPrice += bookingDetail.getUnitPrice();

                if (bookingDetail.getDiscount() == 0) {
                    totalPriceDiscount += bookingDetail.getUnitPrice();
                } else {
                    totalPriceDiscount += bookingDetail.getUnitPrice() - bookingDetail.getUnitPrice() * bookingDetail.getDiscount() / 100;
                }
                List<ServiceBookingEntity> serviceByBookingsId = bookingDetail.getServiceBookings();
                double PriceServiceBybookingDetail = 0;
                if (serviceByBookingsId.size() > 0) {
                    for (ServiceBookingEntity serviceBooking : serviceByBookingsId) {
                        PriceServiceBybookingDetail += serviceBooking.getPrice() * serviceBooking.getQuantity();
                    }
                } else {
                    PriceServiceBybookingDetail = 0;
                }
                totalPriceService += PriceServiceBybookingDetail;
            }
            double minus = totalUnitPrice * 10 / 100;
            double refunds = totalPriceDiscount - minus + totalPriceService;

            PaymentEntity newPaymentByBookingId = new PaymentEntity();
            newPaymentByBookingId.setAmount(minus);
            newPaymentByBookingId.setBooking(booking);
            newPaymentByBookingId.setCreditCart(creditCard);
            newPaymentByBookingId.setPaymentDate(new Date());
            newPaymentByBookingId.setDescription("minus 10% of customer's ticket cancellation");
            listPayments.add(newPaymentByBookingId);
            creditCard.setBalance(creditCard.getBalance() + refunds);
            booking.setBookingStatus(BookingStatusEnum.CANCEL);
            booking.setPayments(listPayments);
            creditCardService.save(creditCard);

            DecimalFormat formatter = new DecimalFormat("###,###,### VND");
            SimpleDateFormat formatterDate = new SimpleDateFormat("dd/MM/yyyy");
            StringBuilder message = new StringBuilder();
            message.append("Ticket cancellation person : ");
            message.append(booking.getFullName());
            message.append("\nCancellation date : ");
            message.append(formatterDate.format(new Date()));
            message.append("\nBooking Number: ");
            message.append(booking.getBookingNumber());
            message.append("\nRefund Amount : ");
            message.append(formatter.format(refunds));
            
            sendMail(booking.getEmail(), "TICKET CANCELLATION SUCCESSFUL", message.toString());

            
        }
        bookingService.save(booking);
        return "redirect:/manager/booking-detail/" + bookingId;
    }

    @RequestMapping("/export")
    public void exportExcel(HttpServletResponse response,
            @SessionAttribute("bookings") List<BookingEntity> bookings) throws IOException {
        response.setContentType("application/octet-stream");
        String headerKey = "Content-Disposition";

        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String currentDate = dateFormat.format(new Date());
        String fileName = "booking_" + currentDate + ".xlsx";
        String headerValue = "attachement; fileName=" + fileName;

        response.setHeader(headerKey, headerValue);

        List<BookingEntity> listBookings = bookingService.getBookings();

        // BookingExcelExporter excelExporter = new BookingExcelExporter(bookingService.setTotalPrice(listBookings)); 
        BookingExcelExporter excelExporter = new BookingExcelExporter(bookings);
        excelExporter.export(response);
    }


    public void sendMail(String to, String subject, String content) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setTo(to);
        mailMessage.setSubject(subject);
        mailMessage.setText(content);

        mailSender.send(mailMessage);
    }

}
