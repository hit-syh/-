package com.syh.service.customer.services;

import com.baomidou.mybatisplus.extension.service.IService;
import com.syh.common.common.Result;
import com.syh.common.customer.pojos.CustomerInf;

/**
* @author shiyu
* @description 针对表【customer_inf(用户信息表)】的数据库操作Service
* @createDate 2024-03-15 17:04:56
*/
public interface CustomerService extends IService<CustomerInf> {

    Result<CustomerInf> customerOverview(Integer customerId);
}
