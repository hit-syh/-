package com.syh.service.order.controller;

import com.syh.common.common.Result;
import com.syh.common.order.dtos.OrderDto;
import com.syh.service.order.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class OrderController {
    @Autowired
    OrdersService ordersService;
    @PostMapping("/addOrder")
    public Result addOrder(@RequestBody OrderDto dto){
        return ordersService.addOrder(dto);
    }
}
