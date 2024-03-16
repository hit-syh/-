package com.syh.service.product.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.syh.common.product.pojos.ProductCategory;
import org.apache.ibatis.annotations.Mapper;

/**
* @author shiyu
* @description 针对表【product_category(商品分类表)】的数据库操作Mapper
* @createDate 2024-03-15 19:29:01
* @Entity com.syh.common.product.pojos.ProductCategory
*/
@Mapper
public interface ProductCategoryMapper extends BaseMapper<ProductCategory> {

}




