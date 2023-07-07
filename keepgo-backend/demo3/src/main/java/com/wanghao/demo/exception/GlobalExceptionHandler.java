package com.wanghao.demo.exception;

import com.wanghao.demo.common.Result;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice
public class GlobalExceptionHandler {
    @ExceptionHandler(ServiceExcepetion.class)
    @ResponseBody
    public Result handle(ServiceExcepetion se){
        return Result.error(se.getCode(),se.getMessage());
    }
}
