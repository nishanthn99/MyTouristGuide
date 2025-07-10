package com.touristguide.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

import com.touristguide.enums.UserType;

@Entity
@Data
public class Notification {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private Integer userId;

    @Enumerated(EnumType.STRING)
    private UserType userType;

    private String message;
    private boolean isRead = false;

    private LocalDateTime createdAt = LocalDateTime.now();
}
