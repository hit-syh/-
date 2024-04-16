package com.syh.common.product.pojos;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import lombok.Data;

/**
 * @TableName product_overview
 */
@TableName(value = "product_overview")
@Data
public class ProductOverview implements Serializable {
    @TableId
    private Long productId;

    private String productTitle;
    @TableField(fill = FieldFill.DEFAULT)
    private String productImageUrl;

    private BigDecimal price;

    private Date modifiedTime;

    private Long categoryId;

    private Integer publishStatus;

    private Integer auditStatus;
    private Integer productOrder;

    private static final long serialVersionUID = 1L;
}