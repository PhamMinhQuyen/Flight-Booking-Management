package com.iviettech.pr38_jv44_flight_booking.entities;

import com.iviettech.pr38_jv44_flight_booking.enums.GeneralStatusEnum;
import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "aircraft")
public class AircraftsEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;

    private String number;

    private int roww;

    private int colum;

    @Transient
    private List<MultipartFile> multipartFiles;

   
    @Enumerated(EnumType.STRING)
    private GeneralStatusEnum status;

    @OneToMany(mappedBy = "aircraft", cascade = CascadeType.ALL)
    private List<AircraftSeatsEntity> aircraftSeats;

    @OneToMany(mappedBy = "aircraft", cascade = CascadeType.ALL)
    private List<FlightsEntity> flights;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "aircraft", cascade = CascadeType.ALL)
    private List<ImageEntity> images;

    public AircraftsEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public int getColum() {
        return colum;
    }

    public void setColum(int colum) {
        this.colum = colum;
    }

    public GeneralStatusEnum getStatus() {
        return status;
    }

    public void setStatus(GeneralStatusEnum status) {
        this.status = status;
    }


    public List<AircraftSeatsEntity> getAircraftSeats() {
        return aircraftSeats;
    }

    public void setAircraftSeats(List<AircraftSeatsEntity> aircraftSeats) {
        this.aircraftSeats = aircraftSeats;
    }

    public int getRoww() {
        return roww;
    }

    public void setRoww(int roww) {
        this.roww = roww;
    }

    public List<FlightsEntity> getFlights() {
        return flights;
    }

    public void setFlights(List<FlightsEntity> flights) {
        this.flights = flights;
    }

    public List<MultipartFile> getMultipartFiles() {
        return multipartFiles;
    }

    public void setMultipartFiles(List<MultipartFile> multipartFiles) {
        this.multipartFiles = multipartFiles;
    }

    public List<ImageEntity> getImages() {
        return images;
    }

    public void setImages(List<ImageEntity> images) {
        this.images = images;
    }

}
