package com.syh.service.customer.controller;

import com.syh.common.common.Result;
import com.syh.common.customer.pojos.CustomerInf;
import com.syh.service.customer.services.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CustomerController {
    @Autowired
    CustomerService customerService;
    //商品中获取店家信息
    @RequestMapping("/customerOverview")
    public Result<CustomerInf> customerOverview(@RequestParam("customerId") Integer customerId){
        return customerService.customerOverview(customerId);
    }
}
