package com.syh.service.customer.services.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.syh.common.customer.pojos.CustomerAddr;
import com.syh.service.customer.mappers.CustomerAddrMapper;
import com.syh.service.customer.services.CustomerAddrService;
import org.springframework.stereotype.Service;

/**
* @author shiyu
* @description 针对表【customer_addr(用户地址表)】的数据库操作Service实现
* @createDate 2024-03-15 17:04:56
*/
@Service
public class CustomerAddrServiceImpl extends ServiceImpl<CustomerAddrMapper, CustomerAddr>
    implements CustomerAddrService {

}




