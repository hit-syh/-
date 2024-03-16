package com.syh.service.customer.services;

import com.syh.common.common.Result;
import com.syh.common.customer.pojos.CustomerLogin;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author shiyu
* @description 针对表【customer_login(用户登录表)】的数据库操作Service
* @createDate 2024-03-15 17:04:56
*/
public interface CustomerLoginService extends IService<CustomerLogin> {

    Result login(CustomerLogin customerLogin);
}
