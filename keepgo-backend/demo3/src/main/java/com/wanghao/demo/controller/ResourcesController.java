package com.wanghao.demo.controller;


import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.SecureUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wanghao.demo.common.Result;
import com.wanghao.demo.entity.Files;
import com.wanghao.demo.entity.Resources;
import com.wanghao.demo.mapper.FileMapper;
import com.wanghao.demo.mapper.ResourcesMapper;
import com.wanghao.demo.service.FilesService;
import com.wanghao.demo.service.impl.ResourcesServiceImpl;
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
 * @since 2022-07-27
 */
@RestController
@RequestMapping("/resources")
public class ResourcesController {
    @Value("${files.upload.path}")
    private String fileUploadPath;
    @Resource
    private FileMapper fileMapper;
    @Resource
    private ResourcesMapper resourcesMapper;
    @Autowired
    private FilesService filesService;
    @Autowired
    private ResourcesServiceImpl resourcesService;

    @PostMapping("/upload")
    public String upload(@RequestParam MultipartFile file,@RequestParam(value="userid")  Integer userid,@RequestParam(value="filename")  String filename,@RequestParam(value="brief")  String  brief) throws IOException {
        //最一开始的原始的文件   这里的文件应该是只有文件名的
        String originalFilename = file.getOriginalFilename();
        String type = FileUtil.extName(originalFilename);//获取文件类型
        String uuid = IdUtil.fastSimpleUUID();   //定义文件的标识码
        long size = file.getSize();   //获取文件的大小
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

        Resources dbResources = getFileByMd5(md5);
        //文件url的获取
        if (dbResources != null) {
            url = dbResources.getUrl();
            System.out.println(url);
            //删除上传的重复的文件
            System.out.println("1111");
            uploadFile.delete();

        } else {
            //数据库中不存在的话就不删除了
            url = "http://localhost:9090/file/" + fileUUID;
        }
        //存储数据库
        Resources saveFile = new Resources();
        saveFile.setName(originalFilename);
        saveFile.setType(type);
        saveFile.setUrl(url);
        saveFile.setMd5(md5);
        saveFile.setSize(size / 1024);
        saveFile.setUserid(userid);
        saveFile.setBrief(brief);
        saveFile.setName(filename);
        saveFile.setDownloadnumber(0);

        resourcesMapper.insert(saveFile);


        return url;
    }
    @GetMapping("/{fileUUID}")
    public void download(@PathVariable String fileUUID,HttpServletResponse response) throws IOException {
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
    private Resources getFileByMd5(String md5){
        QueryWrapper<Resources> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("md5",md5);
        List<Resources> fileList =  resourcesMapper.selectList(queryWrapper);
        return fileList.size() ==0?null:fileList.get(0);
    }

    //RequestBody表示是从界面传过来的东西  将前台的对象转化为json对象
    //新增或修改
//    public Integer save(@RequestBody User user){
//        return userService.save(user);
//    }
    @PostMapping("/update")
    public Result save(@RequestBody Resources files){
        resourcesMapper.updateById(files);
        return  Result.success();
    }


    @GetMapping
    public List<Resources> findAll(){
        return resourcesService.list();//查找所有数据
    }


    @DeleteMapping("/{id}")
    public boolean delete(@PathVariable Integer id){
        return  resourcesService.removeById(id);
    }

    //分页查询  --- mybatisplus
    @GetMapping("/page")
    public IPage<Resources> findPage(@RequestParam Integer pageNum,
                                 @RequestParam Integer pageSize,
                                 @RequestParam(defaultValue = "") String name,//避免搜索为空时的报错
                                 @RequestParam(defaultValue = "") String type){
        IPage<Resources> page = new Page<Resources>(pageNum,pageSize);
        QueryWrapper<Resources> queryWrapper = new QueryWrapper<Resources>();
        if(!"".equals(name)){
            queryWrapper.like("name",name);//框架是直接在中间加了一个and的
        }
        if(!"".equals(type)){
            // queryWrapper.or().like("nickname",nickname);  添加or 但是添加了or的话 会使其它的条件无效 也不是 这样说 就是或者的意思
            queryWrapper.like("type",type);
        }
        System.out.println("SAdsadsasssssss---------------------------------------------------------");
        return resourcesService.page(page,queryWrapper);

    }


    //批量删除
    @PostMapping("/del/batch")
    public boolean deleteBatch(@RequestBody List<Integer> ids){
        return resourcesService.removeByIds(ids);
    }

    //首页推荐资源
    @GetMapping("/newResourcsfHome")
    public Result findNewArticleInHome()
    {
        return Result.success(resourcesService.newResourcesOfhome());
    }
    //更新文章下载次数
    @GetMapping("/upadata/{id}")
    public void updataDownLoad(@PathVariable Integer id )
    {
        resourcesService.upadateDownloadNumber(id);
    }
    //根据下载次数获取推荐资源
        @GetMapping("/getRecommandResouces")
    public Result  getRecommandResouces(){
        return Result.success(resourcesService.getRecommandResours());
        }
//根据用户id查看其上传的资源
    @GetMapping("/ResourcesOfUserPage")
    public IPage<Resources> findUserResourcesPage(@RequestParam Integer pageNum,
                                     @RequestParam Integer pageSize,
                                     @RequestParam(defaultValue = "") String name,//避免搜索为空时的报错
                                     @RequestParam(defaultValue = "") String type,
                                     @RequestParam Integer userid){
        IPage<Resources> page = new Page<Resources>(pageNum,pageSize);
        QueryWrapper<Resources> queryWrapper = new QueryWrapper<Resources>();
        if(!"".equals(name)){
            queryWrapper.like("name",name);//框架是直接在中间加了一个and的
        }
        if(!"".equals(userid)){
            queryWrapper.eq("userid",userid);//框架是直接在中间加了一个and的
        }
        if(!"".equals(type)){
            // queryWrapper.or().like("nickname",nickname);  添加or 但是添加了or的话 会使其它的条件无效 也不是 这样说 就是或者的意思
            queryWrapper.like("type",type);
        }
        return resourcesService.page(page,queryWrapper);

    }

}

