package com.wanghao.demo.config;

import com.wanghao.demo.config.intercepetor.JwtInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {
    @Override
    public  void  addInterceptors(InterceptorRegistry registry){
        registry.addInterceptor(jwtInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns("/**");
//                .excludePathPatterns("/user/**", "/user/register", "/**/export", "/**/import", "/file/**","/front/**","/carousel/**",
//                        "/swagger-resources/**", "/webjars/**", "/v2/**", "/swagger-ui.html/**", "/api", "/api-docs", "/api-docs/**","/article/**",
//                        "/type/**","/comment/**");
    }
    @Bean
    public JwtInterceptor jwtInterceptor(){
            return new JwtInterceptor();
    }
}
