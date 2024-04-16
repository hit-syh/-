package com.syh.service.order.mq;

import com.syh.service.order.service.OrdersService;
import com.syh.service.order.service.impl.OrdersServiceImpl;
import io.seata.spring.annotation.GlobalTransactional;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
import org.apache.rocketmq.spring.core.RocketMQListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
@Slf4j
@Component
public class Consumer {
    @Service

    @RocketMQMessageListener(topic = "Order-Cancel",  consumerGroup = "default-group")
    public class OrderCancelConsumer implements RocketMQListener<Long> {
        @Autowired
        OrdersServiceImpl ordersService;
        @Override
        @GlobalTransactional
        public void onMessage(Long id) {
            log.info("监听到消息+取消订单"+id);
            ordersService.cancelOrder(id);
        }
    }
}
