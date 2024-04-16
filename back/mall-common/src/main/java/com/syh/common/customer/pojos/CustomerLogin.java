package com.syh.common.customer.pojos;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * @TableName customer_login
 */
@TableName(value ="customer_login")
@Data
public class CustomerLogin implements Serializable {
    @TableId
    private Long customerId;

    private String mail;

    private String loginName;

    private String password;

    private Integer userStatus;

    private String salt;

    private Date modifiedTime;

    private static final long serialVersionUID = 1L;
}