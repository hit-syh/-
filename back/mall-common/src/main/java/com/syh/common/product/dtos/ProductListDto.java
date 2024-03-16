package com.syh.common.product.dtos;

import lombok.Data;

@Data
public class ProductListDto {
    Integer current;
    Integer size;
    Integer categoryId;
}
