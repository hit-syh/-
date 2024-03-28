package com.syh.common.customer.vtos;

import com.syh.common.customer.pojos.CustomerLogin;
import lombok.Data;

import java.math.BigDecimal;
@Data
public class CustomerInfoVto extends CustomerLogin {
    private BigDecimal userMoney;
}
