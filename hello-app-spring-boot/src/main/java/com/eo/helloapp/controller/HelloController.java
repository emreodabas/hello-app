package com.eo.helloapp.controller;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import javax.websocket.server.PathParam;

@RestController
public class HelloController {


    @GetMapping("/{name}")
    public String hello(@PathVariable("name") String name) {
        return "Hello " + name;
    }

}
