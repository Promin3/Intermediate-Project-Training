package com.wanghao.demo.mapper;
import  java.util.List;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wanghao.demo.entity.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Resource
//@Mapper
// BaseMapper<User>是必要的 BaseMapper中的方法  用了框架之后发现不用写sql了
public interface UserMapper extends BaseMapper<User> {
//    @Select("select * from sys_user")
//    List<User> findAll();
//
//    @Insert("insert into sys_user(username,password,nickname,email,phone,address) VALUES (#{username},#{password},#{nickname},#{email},#{phone},#{address})")
//    int insert(User user);
//   // @Update("update sys_user set username = #{username},password = #{password},nickname = #{nickname},email = #{email},phone = #{phone},address = #{address} where id = #{id}")
//    int update(User user);
//    @Delete("delete from sys_user where id = #{id}")
//    Integer deleteById(@Param("id") Integer id);
//
////    //模糊查询 通过username
////    @Select("select * from sys_user where username like #{username} Limit #{pageNum},#{pageSize}")
////    List<User> selectPage(@Param("pageNum")Integer pageNum, @Param("pageSize")Integer pageSize,@Param("username")String username);
//
//
    @Select("select count(*) from sys_user where username like #{username} " )
    Integer selectTotal(@Param("username")String username);

    @Select("select u.* from article a left join sys_user u on a.userid = u.id where a.id = #{articleId} ")
    User findUserByArticleId(@Param("articleId")  Integer articleId);

    @Select("select count(*) count, u.* from sys_user u left join  article a on a.user = u.nickname where u.id = #{userId}  ")
    User allInforOfUser(@Param("userId")  Integer userId);

    //按id的倒序挑五个人
    @Select("select u.* from sys_user u order by id desc limit 5")
    List<User> limitFiveUser();

//    查询浏览次数
    @Select("select SUM(a.readnumber) from article a  left join sys_user u on a.userid = u.id where u.id = #{id}")
    Integer findReadNumber(@Param("id") Integer id);
    //查询被收藏数量
    @Select("SELECT count(*) FROM collection c left join  sys_user u on u.id = c.userid where u.id = #{id}")
    Integer findCollectionNumber(@Param("id") Integer id);

}
