package com.syh.common.order.dtos;

import lombok.Data;

@Data
public class OrderDto {
    private String shippingUser;

    private String province;

    private String city;

    private String district;

    private String address;

    private Integer paymentMethod;

    private Long productId;

    private Integer productCnt;
}
