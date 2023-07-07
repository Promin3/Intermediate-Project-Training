package com.wanghao.demo.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wanghao.demo.entity.Loginlog;
import com.wanghao.demo.mapper.CommentMapper;
import com.wanghao.demo.mapper.LoginlogMapper;
import com.wanghao.demo.service.ILoginlogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class LoginlogServiceImpl extends ServiceImpl<LoginlogMapper, Loginlog> implements ILoginlogService {

    @Resource
    private LoginlogMapper loginlogMapper;
}
