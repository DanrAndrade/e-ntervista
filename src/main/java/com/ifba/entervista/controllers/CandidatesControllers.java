package com.ifba.entervista.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class CandidatesControllers {

    @GetMapping("/candidates")
    public ModelAndView index() {
        ModelAndView candidates = new ModelAndView();
        candidates.setViewName("candidate/candidates");
        return candidates;
    }
}
