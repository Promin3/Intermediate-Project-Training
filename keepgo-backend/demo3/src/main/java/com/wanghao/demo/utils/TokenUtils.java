package com.wanghao.demo.utils;


import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.wanghao.demo.entity.User;
import com.wanghao.demo.service.UserService;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
@Component
public class TokenUtils {

    private static UserService staticUserService;
    @Resource
    private UserService userService;
    @PostConstruct
    public void setUserService(){
        staticUserService=userService;
    }

    public static String  genToken(String userId,String sign) {
        return JWT.create().withAudience(userId)//将user的id保存到token中 作为载荷
                .withExpiresAt(DateUtil.offsetHour(new Date(),2))//两小时后token过期
                .sign(Algorithm.HMAC256(sign));//用password作为token的密匙

    };
//静态方法不能调用非静态成员变量
    public static User getCurrentUser(){
        try{
            HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
            String token = request.getHeader("token");
        if(StrUtil.isNotBlank((token))){
            String userId = JWT.decode(token).getAudience().get(0);
            return staticUserService.getById(Integer.valueOf(userId));
            }
        }
        catch (Exception e){
                return null;
        }
        return null;

    }
}
