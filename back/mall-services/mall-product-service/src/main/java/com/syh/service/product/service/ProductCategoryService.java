package com.syh.service.product.service;

import com.syh.common.common.Result;
import com.syh.common.product.pojos.ProductCategory;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author shiyu
* @description 针对表【product_category(商品分类表)】的数据库操作Service
* @createDate 2024-03-15 19:29:01
*/
public interface ProductCategoryService extends IService<ProductCategory> {

    Result categoryList();
}
