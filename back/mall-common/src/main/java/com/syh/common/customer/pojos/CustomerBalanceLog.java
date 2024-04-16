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
 * @TableName customer_balance_log
 */
@TableName(value ="customer_balance_log")
@Data
public class CustomerBalanceLog implements Serializable {
    private Long balanceId;

    private Long customerId;

    private Integer source;

    private Integer sourceSn;

    private Date createTime;

    private BigDecimal amount;

    private static final long serialVersionUID = 1L;
}