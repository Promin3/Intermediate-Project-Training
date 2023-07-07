package com.wanghao.demo.exception;

import lombok.Data;

@Data
public class ServiceExcepetion extends  RuntimeException{

    private String code;//RuntimeException中已经有错误的信息了不用自己在定义msg属性了

    public ServiceExcepetion(String code,String msg){
        super(msg);
        this.code = code;
    }
}
