package com.syh.service.customer.services.impl;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.syh.common.common.MyException;
import com.syh.common.common.Result;
import com.syh.common.common.StatusEnum;
import com.syh.common.customer.pojos.CustomerInf;
import com.syh.common.customer.pojos.CustomerLogin;
import com.syh.common.customer.vtos.CustomerInfoVto;
import com.syh.mall.utils.JwtUtils;
import com.syh.service.customer.mappers.CustomerInfMapper;
import com.syh.service.customer.mappers.CustomerLoginMapper;
import com.syh.service.customer.services.CustomerLoginService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.HashMap;

/**
* @author shiyu
* @description 针对表【customer_login(用户登录表)】的数据库操作Service实现
* @createDate 2024-03-15 17:04:56
*/
@Service
public class CustomerLoginServiceImpl extends ServiceImpl<CustomerLoginMapper, CustomerLogin>
    implements CustomerLoginService {

    @Autowired
    CustomerInfMapper customerInfMapper;
    @Override
    public Result login(CustomerLogin customerLogin) {
        if(StringUtils.isBlank(customerLogin.getMail())){
            throw new MyException(StatusEnum.PARAM_INVALID);
        }
        if(!lambdaQuery().eq(CustomerLogin::getMail, customerLogin.getMail()).exists()){
            throw new MyException(StatusEnum.USER_NOT_EXISTS);
        }
        CustomerLogin one = lambdaQuery().eq(CustomerLogin::getMail, customerLogin.getMail()).one();
        String s = DigestUtils.md5DigestAsHex((customerLogin.getPassword() + one.getSalt()).getBytes());
        if(!s.equals(one.getPassword())){
            throw new MyException(StatusEnum.PASSWORD_ERROR);
        }
        CustomerInf customerInf = customerInfMapper.selectById(one.getCustomerId());
        String jwtToken = JwtUtils.genTokenById(one.getCustomerId());
        one.setSalt(null);
        one.setPassword(null);
        CustomerInfoVto customerInfoVto = new CustomerInfoVto();
        BeanUtils.copyProperties(one,customerInfoVto);
        BeanUtils.copyProperties(customerInfoVto,customerInfoVto);
        HashMap<String, Object> map = new HashMap<>();
        map.put("customer",customerInf);
        map.put("token",jwtToken);
        return Result.success(map);
    }

}




