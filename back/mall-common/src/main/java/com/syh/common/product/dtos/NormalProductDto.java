package com.syh.common.product.dtos;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.syh.common.product.pojos.ProductOverview;
import lombok.Data;

import java.util.Date;
@Data
public class NormalProductDto extends ProductOverview {
    private String productName;

    private Long sellerId;

    private String descript;

    private Integer stock;

}
