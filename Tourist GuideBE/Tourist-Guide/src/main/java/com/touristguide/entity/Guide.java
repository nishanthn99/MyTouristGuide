package com.touristguide.entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import lombok.Data;

@Entity
@Data
public class Guide {
	@Id
	private Integer id;
	private String name;
	private String address;
	private long contact_no;
	@OneToOne(cascade = CascadeType.ALL)
	//@JoinColumn(foreignKey = "education")
	private GuideEducation educationDetails;
	
}
