/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.pr38_jv44_flight_booking.dto;

import com.iviettech.pr38_jv44_flight_booking.entities.BookingEntity;
import com.iviettech.pr38_jv44_flight_booking.service.BookingService;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author ADMIN
 */
public class BookingExcelExporter {

    private XSSFWorkbook workbook;
    private XSSFSheet sheet;

    private List<BookingEntity> listBookings;

    public BookingExcelExporter(List<BookingEntity> listBookings) {
        this.listBookings = listBookings;
        workbook = new XSSFWorkbook();
        sheet = workbook.createSheet("Booking");
    }

    private void writeHeaderRow() {
        Row row = (Row) sheet.createRow(0);

        CellStyle style = workbook.createCellStyle();
        XSSFFont font = workbook.createFont();
        font.setBold(true);
        font.setFontHeight(14);
        style.setFont(font);

        Cell cell = row.createCell(0);
        cell.setCellValue("Booking Number");
        cell.setCellStyle(style);

        cell = row.createCell(1);
        cell.setCellValue("Booking Date");
        cell.setCellStyle(style);

        cell = row.createCell(2);
        cell.setCellValue("Full Name");
        cell.setCellStyle(style);

        cell = row.createCell(3);
        cell.setCellValue("Address");
        cell.setCellStyle(style);

        cell = row.createCell(4);
        cell.setCellValue("Phone Number");
        cell.setCellStyle(style);

        cell = row.createCell(5);
        cell.setCellValue("Birth Date");
        cell.setCellStyle(style);
        

        cell = row.createCell(6);
        cell.setCellValue("Gender");
        cell.setCellStyle(style);

        cell = row.createCell(7);
        cell.setCellValue("Status");
        cell.setCellStyle(style);

        cell = row.createCell(8);
        cell.setCellValue("Amount Price");
        cell.setCellStyle(style);

//        cell = row.createCell(9);
//        cell.setCellValue("CMND");
//        cell.setCellStyle(style);

    }

    private void writeDataRow() {
        int rowCount = 1;

        CellStyle style = workbook.createCellStyle();
        XSSFFont font = workbook.createFont();
        font.setFontHeight(12);
        style.setFont(font);

        for (BookingEntity booking : listBookings) { 
            Row row = sheet.createRow(rowCount++);

            Cell cell = row.createCell(0);
            cell.setCellValue(booking.getBookingNumber());
            sheet.autoSizeColumn(0);
            cell.setCellStyle(style);

            SimpleDateFormat DateFor = new SimpleDateFormat("dd/MM/yyyy");
            String stringDate1= DateFor.format(booking.getBookingDate());
            cell = row.createCell(1);
            cell.setCellValue(stringDate1);
            sheet.autoSizeColumn(1);
            cell.setCellStyle(style);

            cell = row.createCell(2);
            cell.setCellValue(booking.getFullName());
            sheet.autoSizeColumn(2);
            cell.setCellStyle(style);

            cell = row.createCell(3);
            cell.setCellValue(booking.getAddress());
            sheet.autoSizeColumn(3);
            cell.setCellStyle(style);

            cell = row.createCell(4);
            cell.setCellValue(booking.getPhoneNumber());
            sheet.autoSizeColumn(4);
            cell.setCellStyle(style);

            String stringDate= DateFor.format(booking.getBirthDate());
            cell = row.createCell(5);
            cell.setCellValue(stringDate);
            sheet.autoSizeColumn(5);
            cell.setCellStyle(style);

            cell = row.createCell(6);
            cell.setCellValue(booking.getGender());
            sheet.autoSizeColumn(6);
            cell.setCellStyle(style);

            cell = row.createCell(7);
            cell.setCellValue(booking.getBookingStatus().toString());
            sheet.autoSizeColumn(7);
            cell.setCellStyle(style);

            DecimalFormat formatter = new DecimalFormat("###,###,### VND");
            String price = formatter.format(booking.getTotalPrice());
            cell = row.createCell(8);
            cell.setCellValue(price);
            sheet.autoSizeColumn(8);
            cell.setCellStyle(style);
            
//            cell = row.createCell(9);
//            cell.setCellValue(booking.getBookingDetail().get(0).getPassenger().getIdenCode());
//            sheet.autoSizeColumn(9);
//            cell.setCellStyle(style);

//            cell = row.createCell(9);
//            if (booking.getDirection().equalsIgnoreCase("OneTrip")) {
//                cell.setCellValue((int)booking.getBookingDetail().size());
//            } else {
//                cell.setCellValue((int)booking.getBookingDetail().size()/2);
//            }
//            sheet.autoSizeColumn(9);
//            cell.setCellStyle(style);
        }
    }

    public void export(HttpServletResponse response) throws IOException {
        writeHeaderRow();
        writeDataRow();

        ServletOutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        //    workbook.close();
        outputStream.close();

    }

}
