package com.syh.service.customer.controller;

import com.syh.common.common.Result;
import com.syh.common.customer.pojos.CustomerLogin;
import com.syh.service.customer.services.CustomerLoginService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
public class AuthController {
    @Autowired
    CustomerLoginService customerLoginService;
    @PostMapping("/login")
    Result login(@RequestBody CustomerLogin customerLogin){
        return customerLoginService.login(customerLogin);
    }


}
