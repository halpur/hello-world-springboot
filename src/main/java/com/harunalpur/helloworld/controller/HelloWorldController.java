package com.harunalpur.helloworld.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWorldController {

    @RequestMapping(method=RequestMethod.GET, value = "/")
    public String home () {
        return "Hello World!!! I am Harun's first springboot project :)";
    }
    
}
