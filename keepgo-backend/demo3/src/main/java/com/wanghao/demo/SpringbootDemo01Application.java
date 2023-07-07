package com.wanghao.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RestController;

@RestController//接口
@SpringBootApplication
public class SpringbootDemo01Application {


    public static void main(String[] args) {
        SpringApplication.run(SpringbootDemo01Application.class, args);
    }




}
