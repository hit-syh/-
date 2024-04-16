package com.syh.common.product.pojos;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * @TableName product_category
 */
@TableName(value ="product_category")
@Data
public class ProductCategory implements Serializable {
    @TableId
    private Long categoryId;

    private String categoryName;

    private Integer categoryStatus;

    private Date modifiedTime;

    private static final long serialVersionUID = 1L;
}