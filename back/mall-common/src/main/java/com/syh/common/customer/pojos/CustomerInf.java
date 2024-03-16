package com.syh.common.customer.pojos;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import lombok.Data;

/**
 * @TableName customer_inf
 */
@TableName(value ="customer_inf")
@Data
public class CustomerInf implements Serializable {
    @TableId

    private Integer customerId;

    private String customerName;

    private Integer identityCardType;

    private String identityCardNo;

    private Integer mobilePhone;

    private String customerEmail;

    private String gender;

    private Integer userPoint;

    private Date registerTime;

    private Date birthday;

    private Integer customerLevel;

    private BigDecimal userMoney;

    private Date modifiedTime;

    private static final long serialVersionUID = 1L;
}