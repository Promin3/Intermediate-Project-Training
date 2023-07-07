package com.wanghao.demo.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.wanghao.demo.entity.Loginlog;
import com.wanghao.demo.service.ILoginlogService;
import com.wanghao.demo.service.impl.LoginlogServiceImpl;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import cn.hutool.core.util.StrUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wanghao.demo.common.Constants;
import com.wanghao.demo.common.Result;
import com.wanghao.demo.controller.dto.UserDto;
import com.wanghao.demo.entity.User;
import com.wanghao.demo.mapper.UserMapper;
import com.wanghao.demo.service.UserService;
import com.wanghao.demo.service.impl.ArticleServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.List;
@RestController
@ResponseBody
@RequestMapping("/Loginlog")
public class LoginlogController {

    @Autowired
    private LoginlogServiceImpl loginlogService;

    @GetMapping("/page")
    public IPage<Loginlog> FindPage(@RequestParam Integer pageNum,
                                    @RequestParam Integer pageSize)
    {
        IPage<Loginlog> page = new Page<Loginlog>(pageNum,pageSize);
        QueryWrapper<Loginlog> queryWrapper = new QueryWrapper<Loginlog>();

        return loginlogService.page(page,queryWrapper);
    }

    @DeleteMapping("/{id}")
    public boolean delete(@PathVariable Integer id){ return loginlogService.removeById(id);}

    @PostMapping
    public Result save(@RequestBody Loginlog loginlog){
        loginlogService.saveOrUpdate(loginlog);
        return Result.success();
    }

    @PostMapping("/del/batch")
    public boolean deleteBatch(@RequestBody List<Integer> ids)
    {
        return loginlogService.removeByIds(ids);
    }


}
