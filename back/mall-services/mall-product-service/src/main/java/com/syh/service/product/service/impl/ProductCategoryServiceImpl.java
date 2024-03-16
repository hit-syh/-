package com.syh.service.product.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.syh.common.common.Result;
import com.syh.common.product.constants.ProductStatus;
import com.syh.common.product.pojos.ProductCategory;
import com.syh.service.product.service.ProductCategoryService;
import com.syh.service.product.mapper.ProductCategoryMapper;
import org.springframework.stereotype.Service;

/**
* @author shiyu
* @description 针对表【product_category(商品分类表)】的数据库操作Service实现
* @createDate 2024-03-15 19:29:01
*/
@Service
public class ProductCategoryServiceImpl extends ServiceImpl<ProductCategoryMapper, ProductCategory>
    implements ProductCategoryService{

    @Override
    public Result categoryList() {
        return Result.success(lambdaQuery().eq(ProductCategory::getCategoryStatus, ProductStatus.PRODUCT_ON).list());
    }
}




