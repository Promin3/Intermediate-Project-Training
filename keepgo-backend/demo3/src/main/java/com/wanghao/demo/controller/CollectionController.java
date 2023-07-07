package com.wanghao.demo.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wanghao.demo.common.Result;
import com.wanghao.demo.entity.Collection;
import com.wanghao.demo.service.ICollectionService;
import com.wanghao.demo.service.impl.CollectionServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 王浩
 * @since 2022-07-26
 */
@ResponseBody
@RestController
@RequestMapping("/collection")
public class CollectionController {
    @Autowired
    private CollectionServiceImpl collectionService;

    //新增或修改
    @PostMapping//RequestBody表示是从界面传过来的东西  将前台的对象转化为json对象
    //新增或修改
//    public Integer save(@RequestBody User user){
//        return userService.save(user);
//    }
    public Result save(@RequestBody Collection collection){
        collectionService.saveOrUpdate(collection);
        return  Result.success();
    }
    //查询所有信息
    @GetMapping
    public Result findAll()
    {
        return Result.success(collectionService.list());
    }

//
//    @GetMapping("/findAllByTypeName/{name}")
//    public Result  findAllByTypeName(@PathVariable String name ) {
//        return  Result.success(collectionService.FindALLInfor(name));
//    }
    //删除
    @DeleteMapping("/del/{userid}/{articleid}")
    public Result deleteByuseridAndArticleid(@PathVariable Integer userid,@PathVariable Integer articleid) {
        collectionService.removeByUseridAndArticleId(userid,articleid);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        collectionService.removeById(id);
        return Result.success();
    }
    @GetMapping("/{id}")
    public Result getCollectInformationByUserid(@PathVariable Integer id){
       return Result.success( collectionService.getCollectInformationByuserid(id));
    }

    @GetMapping("/aticleId/{id}")
    public Result getArticleIdByUserid(@PathVariable Integer id){
        return Result.success( collectionService.getArticleIdByuserid(id));
    }



    //分页查询
    @GetMapping("/page")
    public IPage<Collection> findPage(@RequestParam Integer pageNum,
                                      @RequestParam Integer pageSize,
                                      @RequestParam(defaultValue = "") String name//避免搜索为空时的报错
    ){
        IPage<Collection> page = new Page<Collection>(pageNum,pageSize);
        QueryWrapper<Collection> queryWrapper = new QueryWrapper<Collection>();
        if(!"".equals(name)){
            queryWrapper.like("name",name);//框架是直接在中间加了一个and的
        }
        return collectionService.page(page,queryWrapper);

    }

    //批量删除
    @PostMapping("/del/batch")
    public boolean deleteBatch(@RequestBody List<Integer> ids){
        return collectionService.removeByIds(ids);
    }
}




