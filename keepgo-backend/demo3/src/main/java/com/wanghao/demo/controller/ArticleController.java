package com.wanghao.demo.controller;


import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wanghao.demo.common.Result;
import com.wanghao.demo.entity.Article;
import com.wanghao.demo.service.IArticleService;
import com.wanghao.demo.service.impl.ArticleServiceImpl;
import com.wanghao.demo.service.impl.TypeServiceImpl;
import com.wanghao.demo.utils.TokenUtils;
//import jdk.nashorn.internal.parser.Token;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import  java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 王浩
 * @since 2022-07-14
 */
@RestController
@ResponseBody
@RequestMapping("/article")
public class ArticleController {
    @Resource
    private IArticleService iArticleService;
    @Autowired
    private ArticleServiceImpl articleService;
    @Autowired
    private TypeServiceImpl typeService;


    // 新增或者更新
    @PostMapping
    public Result save(@RequestBody Article article) {
        if (article.getId() == null) { // 新增
            article.setTime(DateUtil.now());  // new Date()
            article.setUser(TokenUtils.getCurrentUser().getNickname());
            article.setUserid(article.getUserid());
            article.setTypeid(article.getTypeid());
            article.setReadnumber(0);
        }
        articleService.saveOrUpdate(article);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        articleService.removeById(id);
        return Result.success();
    }

    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody java.util.List<Integer> ids) {
        articleService.removeByIds(ids);
        return Result.success();
    }

    @GetMapping
    public Result findAll(@RequestParam(required = false) String start, @RequestParam(required = false) String end) {
        QueryWrapper<Article> queryWrapper = new QueryWrapper<>();

        if (StrUtil.isNotBlank(start)) {
            // where time >= start
            queryWrapper.ge("time", start);
        }
        if (StrUtil.isNotBlank(end)) {
            // where time <= end
            queryWrapper.le("time", end);
        }
        return Result.success(articleService.list(queryWrapper));
    }

    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        articleService.updateReadCount(id);
        Article article =  articleService.getById(id);
        String type = typeService.getById(article.getTypeid()).getName();
        article.setType(type);
        return Result.success(article);
    }

    @GetMapping("/page")
    public Result findPage(
                           @RequestParam Integer pageNum,
                           @RequestParam Integer pageSize,
                           @RequestParam(defaultValue = "") String name) {
        QueryWrapper<Article> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");
        if (StrUtil.isNotBlank(name)) {
            queryWrapper.like("name", name);
        }
        return Result.success(articleService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }


    @GetMapping("/page/personalArticle")
    public Result findPersonalPage(
            @RequestParam Integer pageNum,
            @RequestParam Integer pageSize,
            @RequestParam(defaultValue = "") String name,
            @RequestParam(defaultValue = "") String user) {
        QueryWrapper<Article> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");
        if(!"".equals(name)){
            queryWrapper.like("name",name);//框架是直接在中间加了一个and的
        }
        if(!"".equals(user)){
            queryWrapper.like("user",user);//框架是直接在中间加了一个and的
        }
        return Result.success(articleService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }

    @GetMapping("/personalPage")
    public Result findPersonalPage(
            @RequestParam Integer pageNum,
            @RequestParam Integer pageSize,
            @RequestParam Integer id)
    {
        QueryWrapper<Article> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");
        queryWrapper.eq("userid", id);
        return Result.success(articleService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }

//通过用户名拿到所用的文章
    @GetMapping("/pageOfUsersArticle")
    public Result findUsersPage(
            @RequestParam(defaultValue = "") Integer  id) {
        List<Article> articleList = articleService.findUsersArticle(id);
        return Result.success(articleList);
    }

    @GetMapping("/recommandArticle")
    public  Result findInforOfRecommandArticle(){
        return Result.success(articleService.selectRecommandArticleLimitFive());
    }
//    通过用户id拿到收藏文章的信息
    @GetMapping("/selectCollectionArticle/{userid}")
    public Result selectCollectionArticleInfor(@PathVariable Integer userid )
    {
        return  Result.success(articleService.selectCollectedArticle(userid))     ;
    }
}
