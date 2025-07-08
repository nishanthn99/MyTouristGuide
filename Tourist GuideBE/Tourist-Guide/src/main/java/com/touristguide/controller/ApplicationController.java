package com.touristguide.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/touristguide")
public class ApplicationController {
	
	@GetMapping(path = "home")
	public String homePage() {
		return "Home Page";
	}
}
