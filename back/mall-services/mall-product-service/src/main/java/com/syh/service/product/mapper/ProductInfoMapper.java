package com.syh.service.product.mapper;

import com.syh.common.product.pojos.ProductInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
* @author shiyu
* @description 针对表【product_info(商品信息表)】的数据库操作Mapper
* @createDate 2024-03-15 19:29:01
* @Entity com.syh.common.product.pojos.ProductInfo
*/
@Mapper
public interface ProductInfoMapper extends BaseMapper<ProductInfo> {

}




