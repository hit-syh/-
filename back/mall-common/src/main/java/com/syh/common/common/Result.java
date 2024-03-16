package com.syh.common.common;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Result<T> {
    T Data;
    Integer code;

    public Result(Integer code, String message) {
        this.code = code;
        this.message = message;
    }

    String message;

    public Result(T data, Integer code) {
        Data = data;
        this.code = code;
    }

    public Result(Integer code) {
        this.code = code;
    }
    public Result(StatusEnum status){
        this.code=status.code;
        this.message=status.message;
    }

    public static <T>Result<T> success(T data){
        return new Result<>(data,200);
    }
    public static <T>Result<T> success(){
        return new Result<>(200);
    }
    public static <T>Result<T> error(StatusEnum status){
        return new Result<>(status);
    }
    public static <T>Result<T> error(MyException exception){
        return new Result<>(exception.code,exception.message);
    }
}
