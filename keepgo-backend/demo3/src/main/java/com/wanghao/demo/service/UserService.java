package com.wanghao.demo.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wanghao.demo.common.Constants;
import com.wanghao.demo.controller.dto.UserDto;
import com.wanghao.demo.entity.User;
import com.wanghao.demo.exception.ServiceExcepetion;
import com.wanghao.demo.mapper.UserMapper;
//import com.wanghao.demo.utils.TokenUtils;
import com.wanghao.demo.utils.TokenUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
//继承了ServiceImpl就可以使用mybatisplus里面提供的现成的接口 但是貌似mabatisplus不能提供多表联动的操作
public class UserService extends ServiceImpl<UserMapper,User> {

    @Autowired
    private UserMapper userMapper;
//    public int save(User user){
//        if(user.getId() == null){
//            return userMapper.insert(user);
//        }else{
//            return userMapper.update(user);
//        }
//    }

    public boolean saveUser(User user){
//        if(user.getId() == null){
//           return save(user);
//        }else{
//            return updateById(user);
//        }

        return  saveOrUpdate(user);
    }

    public UserDto login(UserDto userDTO) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();

        queryWrapper.eq("username",userDTO.getUsername());
        queryWrapper.eq("password",userDTO.getPassword());
        User one;
       try{
            one  =  getOne(queryWrapper);  //可能会存在脏数据的情况导致没法查询数据  但是目前来说的事满足需求

       }catch (Exception e){
         throw  new ServiceExcepetion(Constants.CODE_500,"系统错误");
       }
        if(one!=null){
            System.out.println("------------------------------------------------------------------------------"+one);
            BeanUtils.copyProperties(one,userDTO);//忽略大小写的复制给userDto
            System.out.println("-------------------------------"+userDTO);
            String token = TokenUtils.genToken(one.getId().toString(),one.getPassword());
            System.out.println(token);
            userDTO.setToken(token);
            return userDTO;
        }else{
            throw new ServiceExcepetion(Constants.CODE_600,"用户名或密码错误");
        }
    }

    public UserDto adminLogin(UserDto userDTO) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();

        queryWrapper.eq("username",userDTO.getUsername());
        queryWrapper.eq("password",userDTO.getPassword());
        queryWrapper.eq("role",userDTO.getRole());
        User one;
        try{
            one  =  getOne(queryWrapper);  //可能会存在脏数据的情况导致没法查询数据  但是目前来说的事满足需求

        }catch (Exception e){
            throw  new ServiceExcepetion(Constants.CODE_500,"系统错误");
        }
        if(one!=null){
            System.out.println("------------------------------------------------------------------------------"+one);
            BeanUtils.copyProperties(one,userDTO);//忽略大小写的复制给userDto
            System.out.println("-------------------------------"+userDTO);
            String token = TokenUtils.genToken(one.getId().toString(),one.getPassword());
            System.out.println(token);
            userDTO.setToken(token);
            return userDTO;
        }else{
            throw new ServiceExcepetion(Constants.CODE_600,"管理员身份不符或用户名密码不正确");
        }
    }


    public User UserDataFindByUsername(String username){
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();

        queryWrapper.eq("username",username);

        User one = getOne(queryWrapper);

        return  one ;
    }

    public User UserDataFindByArticle(Integer articleId){
        return userMapper.findUserByArticleId(articleId);
    }

    public User allInforOfPersonal(Integer userId){
        return userMapper.allInforOfUser(userId);
    }

//    推荐作者
    public List<User> fiveUser(){
      return  userMapper.limitFiveUser();
    }

    public Integer findReadNumber(Integer id){

        return userMapper.findReadNumber(id);
    }

    public Integer findCollectionNumber(Integer id)
    {
        return  userMapper.findCollectionNumber(id);
    }

}
