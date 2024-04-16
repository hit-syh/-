package com.syh.service.order.fegin;

import com.syh.common.common.Result;
import com.syh.common.order.pojos.OrderProduct;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;
import java.util.Map;

@FeignClient(name = "mall-product-service")
public interface ProductFeignClient {
    @PostMapping("/reduceStock")
    Result<List<OrderProduct>> reduceStock(@RequestBody List<OrderProduct> orderProducts);

    @PostMapping("/recoverStock")
    Result<List<OrderProduct>> recoverStock(@RequestBody List<OrderProduct> orderProducts);
}
