package com.syh.common.common;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@Component
@RestControllerAdvice
public class MyExceptionHandler {
@ExceptionHandler(MyException.class)
public Result exceptionHandler(MyException exception){
    return Result.error(exception);
}
}
