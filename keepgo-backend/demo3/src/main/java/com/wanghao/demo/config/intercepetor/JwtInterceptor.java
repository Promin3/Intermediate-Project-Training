package com.wanghao.demo.config.intercepetor;

import cn.hutool.core.util.StrUtil;
import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTDecodeException;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.wanghao.demo.common.Constants;
import com.wanghao.demo.entity.User;
import com.wanghao.demo.exception.ServiceExcepetion;
import com.wanghao.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class JwtInterceptor implements HandlerInterceptor {

    @Autowired
    private UserService userService;

    @Override
    public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object handler) throws  Exception{


        String token = request.getHeader("token");
        //不是映射方法直接通过
        if(!(handler instanceof HandlerMethod)){
            return true;
        }
        if(StrUtil.isBlank(token))
        {
            throw  new ServiceExcepetion(Constants.CODE_401,"无token，请重新登录！");
        }
        String userId;
        try{
            userId = JWT.decode(token).getAudience().get(0);//取秘钥验证是否合法

        }catch (JWTDecodeException e){
            throw new ServiceExcepetion(Constants.CODE_401,"token,验证失败！");
        }

        User user = userService.getById(userId);
        if(user==null){
            throw  new ServiceExcepetion(Constants.CODE_401,"用户不存在请重新登陆！" );
        }
        //用户密码加签验证  token
        JWTVerifier jwtVerifier = JWT.require(Algorithm.HMAC256(user.getPassword())).build();

        try{
            jwtVerifier.verify(token);
    }catch (JWTVerificationException e){
    throw  new RuntimeException("401");
}

       return true;
    }

}
