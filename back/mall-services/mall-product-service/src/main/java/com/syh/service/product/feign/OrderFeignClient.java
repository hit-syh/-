package com.syh.service.product.feign;

import com.syh.common.common.Result;
import com.syh.common.customer.pojos.CustomerInf;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient(name = "mall-customer-service")
public interface OrderFeignClient {
    @RequestMapping("/customerOverview")
    Result<CustomerInf> customerOverview(@RequestParam("customerId") Long customerId);
}
