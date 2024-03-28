package com.syh.common.product.vtos;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.syh.common.product.pojos.ProductOverview;
import lombok.Data;

import java.util.Date;
@Data
public class ProductInfoVto extends ProductOverview {
    private String productName;

    private Integer brandId;

    private Integer sellerId;

    private String descript;

    private Integer stock;
    @JsonFormat(pattern = "YY年MM月DD日")
    private Date indate;
    private String customerName;

    private Integer mobilePhone;

    private String[] imageUrlList;
}
