package com.syh.service.customer.mappers;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.syh.common.customer.pojos.CustomerBalanceLog;
import org.apache.ibatis.annotations.Mapper;

/**
* @author shiyu
* @description 针对表【customer_balance_log(用户余额变动表)】的数据库操作Mapper
* @createDate 2024-03-15 17:04:56
* @Entity generator.com.syh.customer.pojos.CustomerBalanceLog
*/
@Mapper
public interface CustomerBalanceLogMapper extends BaseMapper<CustomerBalanceLog> {

}




