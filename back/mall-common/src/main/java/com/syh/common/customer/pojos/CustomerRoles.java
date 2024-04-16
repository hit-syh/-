package com.syh.common.customer.pojos;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("customer_id")
public class CustomerRoles {
    Long customerId;
    Long roleId;
}
