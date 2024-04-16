package com.syh.service.customer.services.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.syh.common.common.MyException;
import com.syh.common.common.Result;
import com.syh.common.common.StatusEnum;
import com.syh.common.customer.pojos.CustomerInf;
import com.syh.service.customer.mappers.CustomerInfMapper;
import com.syh.service.customer.services.CustomerService;
import org.springframework.stereotype.Service;

/**
* @author shiyu
* @description 针对表【customer_inf(用户信息表)】的数据库操作Service实现
* @createDate 2024-03-15 17:04:56
*/
@Service
public class CustomerServiceImpl extends ServiceImpl<CustomerInfMapper, CustomerInf>
    implements CustomerService {


    @Override
    public Result<CustomerInf> customerOverview(Long customerId) {
        boolean exists = lambdaQuery().eq(CustomerInf::getCustomerId, customerId).exists();
        if(!exists)
            throw new MyException(StatusEnum.USER_NOT_EXISTS);
        CustomerInf one = lambdaQuery()
                .eq(CustomerInf::getCustomerId, customerId)
                .select(CustomerInf::getCustomerName,CustomerInf::getMobilePhone).one();
        return Result.success(one);
    }
}




