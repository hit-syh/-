package com.syh.service.product.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.syh.common.common.MyException;
import com.syh.common.common.Result;
import com.syh.common.common.StatusEnum;
import com.syh.common.customer.pojos.CustomerInf;
import com.syh.common.order.pojos.OrderProduct;
import com.syh.common.product.dtos.NormalProductDto;
import com.syh.common.product.dtos.ProductListDto;
import com.syh.common.product.pojos.ProductInfo;
import com.syh.common.product.pojos.ProductOverview;
import com.syh.common.product.vtos.ProductInfoVto;
import com.syh.mall.utils.AliyunOSSUtils;
import com.syh.service.product.feign.OrderFeignClient;
import com.syh.service.product.mapper.ProductInfoMapper;
import com.syh.service.product.service.ProductOverviewService;
import com.syh.service.product.mapper.ProductOverviewMapper;
import io.seata.spring.annotation.GlobalTransactional;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static com.syh.common.product.constants.ProductStatus.ADUIT_PASS;
import static com.syh.common.product.constants.ProductStatus.PUBLISH_ON;

/**
* @author shiyu
* @description 针对表【product_overview(商品概括表)】的数据库操作Service实现
* @createDate 2024-03-15 19:29:01
*/
@Service
@Transactional
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
    public Result productInfo(Long productId) {
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
        //图片url分割
        productInfoVto.setImageUrlList(productInfo.getImageUrlList().split(","));

        //卖家信息
        Result<CustomerInf> result = orderFeignClient.customerOverview(productInfo.getSellerId());
        if(result.getCode()!=200){
            throw new MyException(result);
        }
        CustomerInf customerInf = result.getData();
        BeanUtils.copyProperties(customerInf,productInfoVto);
        return Result.success(productInfoVto);
    }

    @Override
    public Result normalProductAdd(NormalProductDto dto, MultipartFile[] imageList) {
        //数据校验省略

        ProductOverview productOverview = new ProductOverview();
        ProductInfo productInfo = new ProductInfo();

        BeanUtils.copyProperties(dto,productOverview);
        BeanUtils.copyProperties(dto,productInfo);
        if(imageList.length>0){
            List<String> imageUrlList=new ArrayList<>();
            for(MultipartFile file:imageList){

                String s = AliyunOSSUtils.fileUpload(file);
                if(s==null)
                    throw new MyException(StatusEnum.PARAM_INVALID);
                imageUrlList.add(s);
            }
            String imageUrl = String.join(",", imageUrlList);
            productInfo.setImageUrlList(imageUrl);
            productOverview.setProductImageUrl(imageUrlList.get(0));
        }
        save(productOverview);
        productInfo.setProductId(productOverview.getProductId());
        productInfoMapper.insert(productInfo);
        return Result.success();
    }
    @GlobalTransactional
    @Override
    public Result<List<OrderProduct>> reduceStock(List<OrderProduct> orderProducts) {
        for (OrderProduct orderProduct : orderProducts) {
            ProductOverview one = lambdaQuery().eq(ProductOverview::getProductId, orderProduct.getProductId()).one();
            if(one.getPublishStatus()!=PUBLISH_ON ||one.getAuditStatus()!=ADUIT_PASS){
                throw new MyException(StatusEnum.PRODUCT_NOT_FOUND);
            }
            orderProduct.setProductName(one.getProductTitle());
            orderProduct.setProductPrice(one.getPrice());
            ProductInfo productInfo = productInfoMapper.selectOne(Wrappers.<ProductInfo>lambdaQuery().eq(ProductInfo::getProductId,one.getProductId()).last("for update"));
            if(productInfo.getStock()-orderProduct.getProductCnt()<0){
                throw new MyException(StatusEnum.PRODUCT_STOCK_NOT_ENOUGH);
            }
            productInfo.setStock(productInfo.getStock()-orderProduct.getProductCnt());
            productInfoMapper.updateById(productInfo);
        }
        return Result.success(orderProducts);
    }

    @Override
    @GlobalTransactional
    public Result<List<OrderProduct>> recoverStock(List<OrderProduct> orderProducts) {
        for (OrderProduct orderProduct : orderProducts) {
            ProductOverview one = lambdaQuery().eq(ProductOverview::getProductId, orderProduct.getProductId()).one();

            ProductInfo productInfo = productInfoMapper.selectOne(Wrappers.<ProductInfo>lambdaQuery().eq(ProductInfo::getProductId,one.getProductId()).last("for update"));
            productInfo.setStock(productInfo.getStock()+orderProduct.getProductCnt());
            productInfoMapper.updateById(productInfo);
        }
        return Result.success(null);
    }
}




