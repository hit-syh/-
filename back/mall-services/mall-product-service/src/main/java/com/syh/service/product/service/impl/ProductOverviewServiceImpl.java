package com.syh.service.product.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.syh.common.common.MyException;
import com.syh.common.common.Result;
import com.syh.common.common.StatusEnum;
import com.syh.common.customer.pojos.CustomerInf;
import com.syh.common.product.dtos.ProductListDto;
import com.syh.common.product.pojos.ProductInfo;
import com.syh.common.product.pojos.ProductOverview;
import com.syh.common.product.vtos.ProductInfoVto;
import com.syh.service.product.feign.OrderFeignClient;
import com.syh.service.product.mapper.ProductInfoMapper;
import com.syh.service.product.service.ProductOverviewService;
import com.syh.service.product.mapper.ProductOverviewMapper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.syh.common.product.constants.ProductStatus.ADUIT_PASS;
import static com.syh.common.product.constants.ProductStatus.PUBLISH_ON;

/**
* @author shiyu
* @description 针对表【product_overview(商品概括表)】的数据库操作Service实现
* @createDate 2024-03-15 19:29:01
*/
@Service
public class ProductOverviewServiceImpl extends ServiceImpl<ProductOverviewMapper, ProductOverview>
    implements ProductOverviewService{
    @Autowired
    ProductInfoMapper productInfoMapper;
    @Autowired
    OrderFeignClient orderFeignClient;

    @Override
    public Result productList(ProductListDto dto) {
        if(dto.getSize()==null ||dto.getSize()<=0){
            dto.setSize(10);
        }
        if(dto.getCurrent()==null|| dto.getCurrent()<0){
            dto.setCurrent(0);
        }
        Page<ProductOverview> page = new Page<>(dto.getCurrent(),dto.getSize());
        lambdaQuery()
                .eq(ProductOverview::getAuditStatus,ADUIT_PASS)
                .eq(ProductOverview::getPublishStatus,PUBLISH_ON)
                .eq(dto.getCategoryId()!=null,ProductOverview::getCategoryId,dto.getCategoryId())
                .page(page);
        return Result.success(page);
    }

    @Override
    public Result productInfo(Integer productId) {
        boolean exists_over = lambdaQuery()
                .eq(ProductOverview::getAuditStatus, ADUIT_PASS)
                .eq(ProductOverview::getPublishStatus, PUBLISH_ON)
                .eq(ProductOverview::getProductId, productId)
                .exists();
        boolean exists_info = productInfoMapper.exists(Wrappers.<ProductInfo>lambdaQuery()
                .eq(ProductInfo::getProductId, productId));

        if(!exists_info || !exists_over)
            throw new MyException(StatusEnum.PRODUCT_NOT_FOUND);
        ProductOverview productOverview = lambdaQuery()
                .eq(ProductOverview::getAuditStatus, ADUIT_PASS)
                .eq(ProductOverview::getPublishStatus, PUBLISH_ON)
                .eq(ProductOverview::getProductId, productId)
                .one();
        ProductInfo productInfo = productInfoMapper.selectOne(Wrappers.<ProductInfo>lambdaQuery()
                .eq(ProductInfo::getProductId, productId));
        ProductInfoVto productInfoVto = new ProductInfoVto();
        BeanUtils.copyProperties(productOverview,productInfoVto);
        BeanUtils.copyProperties(productInfo,productInfoVto);

        //卖家信息
        Result<CustomerInf> result = orderFeignClient.customerOverview(productInfo.getSellerId());
        if(result.getCode()!=200){
            throw new MyException(result);
        }
        CustomerInf customerInf = result.getData();
        BeanUtils.copyProperties(customerInf,productInfoVto);
        return Result.success(productInfoVto);
    }
}




