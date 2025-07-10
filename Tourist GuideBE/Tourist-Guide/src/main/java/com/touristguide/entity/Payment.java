package com.touristguide.entity;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Data
public class Payment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @OneToOne
    private Booking booking;

    private double amount;

    private String paymentStatus; // PENDING, COMPLETED, FAILED

    private java.time.LocalDateTime paymentDate;

    private String stripeSessionId;
}

