package com.ifba.entervista.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class HomeControllers {
	
	@GetMapping("/home")
	public ModelAndView index() {
		ModelAndView home = new ModelAndView();
		home.setViewName("home/index");
		return home;
	}
}