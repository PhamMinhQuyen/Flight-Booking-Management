
package com.iviettech.pr38_jv44_flight_booking.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "operations")
public class OperationsEntity implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @Column(length = 100)
    private String name;
    
    @OneToMany(mappedBy = "operation", cascade = CascadeType.ALL)
    private List<FlightsEntity> flights;

    public OperationsEntity() {
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

    public List<FlightsEntity> getFlights() {
        return flights;
    }

    public void setFlights(List<FlightsEntity> flights) {
        this.flights = flights;
    }
    
    
    
}
