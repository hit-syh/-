package com.syh.service.customer.mappers;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.syh.common.customer.pojos.CustomerInf;
import org.apache.ibatis.annotations.Mapper;

/**
* @author shiyu
* @description 针对表【customer_inf(用户信息表)】的数据库操作Mapper
* @createDate 2024-03-15 17:04:56
* @Entity generator.com.syh.customer.pojos.CustomerInf
*/
@Mapper
public interface CustomerInfMapper extends BaseMapper<CustomerInf> {

}




