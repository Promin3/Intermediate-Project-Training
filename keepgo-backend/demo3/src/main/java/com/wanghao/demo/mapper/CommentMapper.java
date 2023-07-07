package com.wanghao.demo.mapper;

import com.wanghao.demo.entity.Comment;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import  java.util.List;

import java.awt.*;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 王浩
 * @since 2022-07-18
 */
@Mapper
public interface CommentMapper extends BaseMapper<Comment> {

    @Select("select c.*,u.avatar_url ,u.nickname from t_comment c left join sys_user u on c.user_id = u.id where c.article_id = #{articleId} order by id desc")
    List<Comment> findCommentDetail(@Param("articleId")  Integer articleId);

}
