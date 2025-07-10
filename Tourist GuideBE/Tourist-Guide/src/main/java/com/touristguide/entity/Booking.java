package com.touristguide.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import lombok.Data;

@Entity
@Data
public class Booking {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    private Visitor visitor;

    @ManyToOne
    private Tour tour;

    private int participants;

    private String status; // PENDING, CONFIRMED, CANCELLED

    private java.time.LocalDate bookingDate;
}
