package com.example.demo.controller;

import com.example.demo.domain.Business;
import com.example.demo.repository.BusinessRepository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/businesses")
public class BusinessController {

    private BusinessRepository businessRepository;

    public BusinessController(BusinessRepository businessRepository){
        this.businessRepository = businessRepository;
    }

    @GetMapping("/all")
    public List<Business> getAll(){
        List<Business> businesses = this.businessRepository.findAll();
        return businesses;
    }

}
