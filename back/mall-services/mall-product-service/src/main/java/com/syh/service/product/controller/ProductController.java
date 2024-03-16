package com.syh.service.product.controller;

import com.syh.common.common.Result;
import com.syh.common.product.dtos.ProductListDto;
import com.syh.service.product.service.ProductCategoryService;
import com.syh.service.product.service.ProductOverviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ProductController {
    @Autowired
    ProductCategoryService productCategoryService;
    @Autowired
    ProductOverviewService productOverviewService;
    @GetMapping("/categoryList")
    public Result categoryList(){
        return productCategoryService.categoryList();
    }
    @GetMapping("/productList")
    public Result productList(ProductListDto dto){
        return productOverviewService.productList(dto);
    }
    @GetMapping("/productInfo")
    public Result productInfo(Integer productId){
        return productOverviewService.productInfo(productId);
    }
}
