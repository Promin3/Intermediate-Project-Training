package com.wanghao.demo.controller;

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

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.List;

@RestController
@ResponseBody
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UserService userService;
    @Autowired
    private ArticleServiceImpl articleService;
    //增加用户
    @PostMapping//RequestBody表示是从界面传过来的东西  将前台的对象转化为json对象
    //新增或修改
//    public Integer save(@RequestBody User user){
//        return userService.save(user);
//    }
    public Result save(@RequestBody User user){
        userService.saveOrUpdate(user);
        articleService.updateArticleUserNames();
        return  Result.success();//使用mybatisplus直接提供的接口
    }


    @GetMapping
    public List<User> findAll(){
        return userService.list();//查找所有数据
    }


    @DeleteMapping("/{id}")
    public boolean delete(@PathVariable Integer id){
       return  userService.removeById(id);
    }
    //分页查询 --- 手写
    //接口路径/user/page
    //@RequestParam ?pageNum=1&pageSize=10
//    @GetMapping("/page")
//    public Map<String,Object> findPage(@RequestParam Integer pageNum,@RequestParam Integer pageSize,@RequestParam String username){
//        pageNum=(pageNum-1)*pageSize;
//        username = "%" + username + "%";
//        List<User> data = userMapper.selectPage(pageNum,pageSize,username);
//        Integer total = userMapper.selectTotal(username);
//        Map<String,Object> res = new HashMap<>();
//        res.put("data",data);
//        res.put("total",total);
//        return res;
//    }

    //分页查询  --- mybatisplus
    @GetMapping("/page")
    public IPage<User> findPage(@RequestParam Integer pageNum,
                                @RequestParam Integer pageSize,
                                @RequestParam(defaultValue = "") String username,//避免搜索为空时的报错
                                @RequestParam(defaultValue = "") String email,
                                @RequestParam(defaultValue = "") String address){
        IPage<User> page = new Page<User>(pageNum,pageSize);
        QueryWrapper<User> queryWrapper = new QueryWrapper<User>();
        if(!"".equals(username)){
            queryWrapper.like("username",username);//框架是直接在中间加了一个and的
        }
        if(!"".equals(address)){
            // queryWrapper.or().like("nickname",nickname);  添加or 但是添加了or的话 会使其它的条件无效 也不是 这样说 就是或者的意思
            queryWrapper.like("address",address);
        }
        if(!"".equals(email)){
            queryWrapper.like("email",email);//框架是直接在中间加了一个and的
        }
        return userService.page(page,queryWrapper);

    }


    //批量删除
    @PostMapping("/del/batch")
    public boolean deleteBatch(@RequestBody List<Integer> ids){
        return userService.removeByIds(ids);
    }

    //通过id查用户信息
//    @RequestParam(defaultValue = "") String name
    @PostMapping("/searchAllInfor")
    public Result findUserInforById(@RequestBody User user){
        return Result.success(userService.getById(user.getId()));

    }
    //导出
    @GetMapping("/export")
    public void export(HttpServletResponse response) throws Exception{
        List<User> list = userService.list();//首先查询所有的用户

        ExcelWriter writer = ExcelUtil.getWriter(true);
        //定义标题
//        writer.addHeaderAlias("username","用户名");
//        writer.addHeaderAlias("password","密码");
//        writer.addHeaderAlias("nickname","昵称");
//        writer.addHeaderAlias("email","邮箱");
//        writer.addHeaderAlias("phone","电话");
//        writer.addHeaderAlias("address","地址");
//        writer.addHeaderAlias("createTime","创建时间");
//        writer.addHeaderAlias("avatarUrl","头像");

        writer.write(list,true);

        //设置浏览器写出响应的格式
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("用户信息","UTF-8");
        response.setHeader("Content-Disposition","attachment;filename="+fileName+".xlsx");

        ServletOutputStream out  = response.getOutputStream();
        writer.flush(out,true);
        out.close();
        writer.close();

    }

    //导入
    @PostMapping("/import")
    public Boolean imp(MultipartFile file) throws Exception{
        InputStream inputStream = file.getInputStream();
        ExcelReader reader = ExcelUtil.getReader(inputStream);
        List<User> list = reader.readAll(User.class);//中文表头读入到数据库中//要求表头必须是英文
        userService.saveBatch(list);
        return true;
    }


//    RequestBody将前端的json对象转变为java对象
    @PostMapping("/login")
    public Result login(@RequestBody UserDto userDTO){
        String username = userDTO.getUsername();
        String password = userDTO.getPassword();

        if(StrUtil.isBlank(username)||StrUtil.isBlank(password)){
            return Result.error(Constants.CODE_400,"参数错误！");
        }
        UserDto dto = userService.login(userDTO);
        System.out.println(dto.getToken());
        return Result.success(dto);
    }
//    管理员登录
@PostMapping("/adminLogin")
public Result AdminLogin(@RequestBody UserDto userDTO){
    String username = userDTO.getUsername();
    String password = userDTO.getPassword();
    String role = userDTO.getRole();

    if(StrUtil.isBlank(username)||StrUtil.isBlank(password)||StrUtil.isBlank(role)){
        return Result.error(Constants.CODE_400,"参数错误！");
    }
    UserDto dto = userService.adminLogin(userDTO);
    System.out.println(dto.getToken());
    return Result.success(dto);
}

    @PostMapping("/register")
    public Result register(@RequestBody UserDto userDTO){
        String username = userDTO.getUsername();
        String password = userDTO.getPassword();
        Integer count = userMapper.selectTotal(username);
        System.out.println(count);
        if(count>=1){
            return Result.error(Constants.CODE_400,"用户名已经被占用！");
        }else{
                User user = new User();
                user.setUsername(username);
                user.setPassword(password);
                user.setRole("会员");
                userService.save(user);
                return Result.success();
        }
    };
    @GetMapping("/username/{username}")
    public Result personDate(@PathVariable String username){
        User user = userService.UserDataFindByUsername(username);
        if(user!=null){
            return Result.success(user);
        }else{
            return  Result.error(Constants.CODE_400,"参数错误！");
        }
    }
//    通过文章的作者id名称拿到作者的全部信息
    @GetMapping("/findUserInfor/{articleId}")
    public Result findUserByArticle_user(@PathVariable Integer articleId){
       User user = userService.UserDataFindByArticle(articleId);
       return Result.success(user);
    }

    @GetMapping("/PersonalCenter/{userId}")
    public Result findPersonalInforById(@PathVariable Integer userId)
    {
        return Result.success( userService.allInforOfPersonal(userId));
    }

    @GetMapping("/recommandUser")
    public  Result recommandUser(){
        return Result.success(userService.fiveUser());
    }
//查询用户被浏览次数
    @GetMapping("/findReadNumber/{id}")
    public Result findReadNumber(@PathVariable Integer id)
    {
        return Result.success(userService.findReadNumber(id));
    }
//    查询用户被收藏量
    @GetMapping("/findCollectionNumber/{id}")
    public  Result findCollectiongNumber(@PathVariable Integer id)
    {
        return Result.success(userService.findCollectionNumber(id));
    }

}
