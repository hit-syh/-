package com.syh.service.order.mq;

import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.spring.core.RocketMQTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.Message;
import org.springframework.messaging.support.MessageBuilder;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
@Slf4j
public class Producer {
    @Autowired
    RocketMQTemplate rocketMQTemplate;
    public void sendOrderCancelMessage(Long id){
        log.info("发送取消订单"+id);
        Message<Long> message = MessageBuilder.withPayload(id).build();
//        rocketMQTemplate.syncSend("Order-Cancel",message,1000*3,2);
        rocketMQTemplate.syncSend("Order-Cancel",message,1000*3,8);
    }
}
