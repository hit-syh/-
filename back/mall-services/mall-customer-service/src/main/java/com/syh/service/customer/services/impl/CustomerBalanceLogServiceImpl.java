package com.syh.service.customer.services.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.syh.common.customer.pojos.CustomerBalanceLog;
import com.syh.service.customer.mappers.CustomerBalanceLogMapper;
import com.syh.service.customer.services.CustomerBalanceLogService;
import org.springframework.stereotype.Service;

/**
* @author shiyu
* @description 针对表【customer_balance_log(用户余额变动表)】的数据库操作Service实现
* @createDate 2024-03-15 17:04:56
*/
@Service
public class CustomerBalanceLogServiceImpl extends ServiceImpl<CustomerBalanceLogMapper, CustomerBalanceLog>
    implements CustomerBalanceLogService {

}




