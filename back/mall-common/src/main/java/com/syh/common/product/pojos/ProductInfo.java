package com.syh.common.product.pojos;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * @TableName product_info
 */
@TableName(value ="product_info")
@Data
public class ProductInfo implements Serializable {
    @TableId
    private Integer productId;

    private String productName;

    private Integer brandId;

    private Integer sellerId;

    private String descript;

    private Integer stock;

    private Date indate;

    private Date modifiedTime;

    private static final long serialVersionUID = 1L;
}