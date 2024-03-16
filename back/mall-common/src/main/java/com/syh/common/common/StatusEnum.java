package com.syh.common.common;

public enum StatusEnum {
    PASSWORD_ERROR(400, "密码错误"),
    PARAM_INVALID(400, "参数无效"),
    USER_NOT_EXISTS(400, "用户不存在"),
    PRODUCT_NOT_FOUND(400, "商品不存在");
    final Integer code;
    final String message;

    StatusEnum(Integer code, String message) {
        this.code = code;
        this.message = message;
    }

}
