package com.touristguide.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.touristguide.entity.Guide;

public interface GuideRepository extends JpaRepository<Guide, Integer>{

}
