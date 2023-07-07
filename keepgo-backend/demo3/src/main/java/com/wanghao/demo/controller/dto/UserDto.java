package com.wanghao.demo.controller.dto;

import lombok.Data;

//接收前端登录请求
@Data
public class UserDto {
    private Integer id;
    private String username;
    private String password;
    private String nickname;
    private String avatarUrl;
    private String token;
    private String role;
}
