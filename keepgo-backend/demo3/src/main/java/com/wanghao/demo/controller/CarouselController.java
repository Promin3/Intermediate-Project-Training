package com.wanghao.demo.controller;


import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.SecureUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wanghao.demo.common.Result;
import com.wanghao.demo.entity.Carousel;
import com.wanghao.demo.mapper.CarouselMapper;
import com.wanghao.demo.service.ICarouselService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 王浩
 * @since 2022-07-16
 */

@RestController
@ResponseBody
@RequestMapping("/carousel")
public class CarouselController {
    @Value("${files.upload.path}")
    private String fileUploadPath;
    @Resource
    private CarouselMapper carouselMapper;
    @Autowired
    private ICarouselService carouselService;

    @PostMapping("/upload")
    public String upload(@RequestParam MultipartFile file) throws IOException {
        System.out.println("hhhhhhhhhhhhhhhhhhhhhhhh");
        //最一开始的原始的文件   这里的文件应该是只有文件名的

        String originalFilename = file.getOriginalFilename();
        String type = FileUtil.extName(originalFilename);//获取文件类型
        String uuid = IdUtil.fastSimpleUUID();   //定义文件的标识码

        String fileUUID = uuid + StrUtil.DOT + type;//文件的标识码


        //先存储到磁盘
        File uploadFile = new File(fileUploadPath + fileUUID);
        File parentFile = uploadFile.getParentFile();
        if (!parentFile.exists()) {   //判断配置的文件目录是否存在
            parentFile.mkdirs();
        }


        String url;
        //存
        file.transferTo(uploadFile);
        //获取md5
        String md5 = SecureUtil.md5(uploadFile);

        Carousel dbFiles = getFileByMd5(md5);
        //文件url的获取
        if (dbFiles != null) {
            url = dbFiles.getUrl();
            System.out.println(url);
            //删除上传的重复的文件
            System.out.println("1111");
            uploadFile.delete();

        } else {
            //数据库中不存在的话就不删除了
            url = "http://localhost:9090/carousel/" + fileUUID;
        }
        //存储数据库
        Carousel saveFile = new Carousel();
        saveFile.setName(originalFilename);
        saveFile.setUrl(url);
        saveFile.setMd5(md5);
        carouselMapper.insert(saveFile);


        return url;
    }
//        String originalFilename = file.getOriginalFilename();
//        String type = FileUtil.extName(originalFilename);
//        long size = file.getSize();

//        // 定义一个文件唯一的标识码
//        String fileUUID = IdUtil.fastSimpleUUID() + StrUtil.DOT + type;
//
//        File uploadFile = new File(fileUploadPath + fileUUID);
//        // 判断配置的文件目录是否存在，若不存在则创建一个新的文件目录
//        File parentFile = uploadFile.getParentFile();
//        if(!parentFile.exists()) {
//            parentFile.mkdirs();
//        }
//
//        String url;
//        // 获取文件的md5
//        String md5 = SecureUtil.md5(file.getInputStream());
//        // 从数据库查询是否存在相同的记录
//        Files dbFiles = getFileByMd5(md5);
//        if (dbFiles != null) {
//            url = dbFiles.getUrl();
//        } else {
//            // 上传文件到磁盘
//            file.transferTo(uploadFile);
//            // 数据库若不存在重复文件，则不删除刚才上传的文件
//            url = "http://" + serverIp + ":9090/file/" + fileUUID;
//        }
//        if(adFiles ! =)
//
//
//        // 存储数据库
//        Files saveFile = new Files();
//        saveFile.setName(originalFilename);
//        saveFile.setType(type);
//        saveFile.setSize(size/1024); // 单位 kb
//        saveFile.setUrl(url);
//        saveFile.setMd5(md5);
//        fileMapper.insert(saveFile);

    // 从redis取出数据，操作完，再设置（不用查询数据库）
//        String json = stringRedisTemplate.opsForValue().get(Constants.FILES_KEY);
//        List<Files> files1 = JSONUtil.toBean(json, new TypeReference<List<Files>>() {
//        }, true);
//        files1.add(saveFile);
//        setCache(Constants.FILES_KEY, JSONUtil.toJsonStr(files1));


    // 从数据库查出数据
//        List<Files> files = fileMapper.selectList(null);
//        // 设置最新的缓存
//        setCache(Constants.FILES_KEY, JSONUtil.toJsonStr(files));

    // 最简单的方式：直接清空缓存
//        flushRedis(Constants.FILES_KEY);
//
////        return url;
//    }


    @GetMapping("/{fileUUID}")
    public void download(@PathVariable String fileUUID, HttpServletResponse response) throws IOException {
        //通过文件的标识码获取文件
        //通过表示位拿到文件路径
        File uploadFile = new File(fileUploadPath+fileUUID);
        ServletOutputStream os = response.getOutputStream();
        response.addHeader("Content-Disposition","attachment;filename="+ URLEncoder.encode(fileUUID,"UTF-8"));

        response.setContentType("application/octet-stream");

        //读取文件的字节流
        os.write(FileUtil.readBytes(uploadFile));
        os.flush();
        os.close();

    }

    /**
     * 通过文件的md5来查取文件
     * @param md5
     * @return
     */
    //通过md5查询文件
    private Carousel getFileByMd5(String md5){
        QueryWrapper<Carousel> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("md5",md5);
        List<Carousel> carouselList =  carouselMapper.selectList(queryWrapper);
        return carouselList.size() ==0?null:carouselList.get(0);
    }

    //RequestBody表示是从界面传过来的东西  将前台的对象转化为json对象
    //新增或修改
//    public Integer save(@RequestBody User user){
//        return userService.save(user);
//    }
    @PostMapping("/update")
    public Result save(@RequestBody Carousel carousel){
        carouselMapper.updateById(carousel);
        return  Result.success();
    }


    @GetMapping
    public List<Carousel> findAll(){
        return carouselService.list();//查找所有数据
    }


    @DeleteMapping("/{id}")
    public boolean delete(@PathVariable Integer id){
        return  carouselService.removeById(id);
    }

    //分页查询  --- mybatisplus
    @GetMapping("/page")
    public IPage<Carousel> findPage(@RequestParam Integer pageNum,
                                 @RequestParam Integer pageSize,
                                 @RequestParam(defaultValue = "") String name)//避免搜索为空时的报错
    {
        IPage<Carousel> page = new Page<Carousel>(pageNum,pageSize);
        QueryWrapper<Carousel> queryWrapper = new QueryWrapper<Carousel>();
        if(!"".equals(name)){
            queryWrapper.like("name",name);//框架是直接在中间加了一个and的
        }
        return carouselService.page(page,queryWrapper);

    }


    //批量删除
    @PostMapping("/del/batch")
    public boolean deleteBatch(@RequestBody List<Integer> ids){
        return carouselService.removeByIds(ids);
    }

}

