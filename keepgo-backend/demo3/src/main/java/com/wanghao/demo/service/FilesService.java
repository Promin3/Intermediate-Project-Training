package com.wanghao.demo.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wanghao.demo.entity.Files;
import com.wanghao.demo.entity.User;
import com.wanghao.demo.mapper.FileMapper;
import com.wanghao.demo.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FilesService extends ServiceImpl<FileMapper,Files> {
}
