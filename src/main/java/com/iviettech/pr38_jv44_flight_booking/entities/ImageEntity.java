
package com.iviettech.pr38_jv44_flight_booking.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "image")
public class ImageEntity implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @Column(length = 100)
    private String name;
    
    @ManyToOne
    @JoinColumn(name = "aircraft_id")
    private AircraftsEntity aircraft;
    
    @ManyToOne
    @JoinColumn(name = "airport_id")
    private AirportsEntity airport;
    
    @ManyToOne
    @JoinColumn(name = "service_id")
    private ServiceEntity service;
    
      @Transient
    private List<MultipartFile> multipartFiles; 

    public ImageEntity() {
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

    public AircraftsEntity getAircraft() {
        return aircraft;
    }

    public void setAircraft(AircraftsEntity aircraft) {
        this.aircraft = aircraft;
    }

    public AirportsEntity getAirport() {
        return airport;
    }

    public void setAirport(AirportsEntity airport) {
        this.airport = airport;
    }

    public ServiceEntity getService() {
        return service;
    }

    public void setService(ServiceEntity service) {
        this.service = service;
    }

    public List<MultipartFile> getMultipartFiles() {
        return multipartFiles;
    }

    public void setMultipartFiles(List<MultipartFile> multipartFiles) {
        this.multipartFiles = multipartFiles;
    }
    
    
    
    
}
