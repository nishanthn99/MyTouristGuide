package com.touristguide.entity;

import jakarta.persistence.CascadeType;
import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToOne;

@Entity
@DiscriminatorValue("GUIDE")
public class Guide extends User {
    @OneToOne(mappedBy = "guide", cascade = CascadeType.ALL)
    private GuideProfile guideProfile;
}