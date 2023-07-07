package com.wanghao.demo.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wanghao.demo.common.Result;
import com.wanghao.demo.entity.Article;
import com.wanghao.demo.entity.Comment;
import com.wanghao.demo.entity.Type;
import com.wanghao.demo.entity.User;
import com.wanghao.demo.service.impl.TypeServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/type")
public class TypeController {
    @Autowired
    private TypeServiceImpl typeService;

    //新增或修改
    @PostMapping//RequestBody表示是从界面传过来的东西  将前台的对象转化为json对象
    //新增或修改
//    public Integer save(@RequestBody User user){
//        return userService.save(user);
//    }
    public Result save(@RequestBody Type type){
        typeService.saveOrUpdate(type);
        return  Result.success();//使用mybatisplus直接提供的接口
    }
    //查询所有信息
    @GetMapping
    public Result findAll()
    {
        List<Type> typeList= typeService.list();

        for(Type type :typeList)
        {
            //通过type的id拿到三个文章
           List<Article> articles =  typeService.FindLimitNumberArticle(type.getId());
           type.setChildren(articles);
        }


        return Result.success(typeList);
    }


    @GetMapping("/findAllByTypeName/{name}")
    public Result  findAllByTypeName(@PathVariable String name ) {
        return  Result.success(typeService.FindALLInfor(name));
    }
    //删除
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        typeService.removeById(id);
        return Result.success();
    }
    //分页查询
    @GetMapping("/page")
    public IPage<Type> findPage(@RequestParam Integer pageNum,
                                @RequestParam Integer pageSize,
                                @RequestParam(defaultValue = "") String name//避免搜索为空时的报错
                               ){
        IPage<Type> page = new Page<Type>(pageNum,pageSize);
        QueryWrapper<Type> queryWrapper = new QueryWrapper<Type>();
        if(!"".equals(name)){
            queryWrapper.like("name",name);//框架是直接在中间加了一个and的
        }
        return typeService.page(page,queryWrapper);

    }

    //批量删除
    @PostMapping("/del/batch")
    public boolean deleteBatch(@RequestBody List<Integer> ids){
        return typeService.removeByIds(ids);
    }
}

