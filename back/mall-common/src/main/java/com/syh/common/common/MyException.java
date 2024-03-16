package com.syh.common.common;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class MyException extends RuntimeException{
    int code;
    String message;
    public MyException(StatusEnum status){
        this.code=status.code;
        this.message=status.message;
    }
    public MyException(Result result){
        this.code=result.code;
        this.message=result.message;
    }

}
