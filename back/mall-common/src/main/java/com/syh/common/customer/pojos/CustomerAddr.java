package com.syh.common.customer.pojos;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * @TableName customer_addr
 */
@TableName(value ="customer_addr")
@Data
public class CustomerAddr implements Serializable {
    private Long customerAddrId;

    private Long customerId;

    private Integer zip;

    private Integer province;

    private Integer city;

    private Integer district;

    private String address;

    private Integer isDefault;

    private Date modifiedTime;

    private static final long serialVersionUID = 1L;
}