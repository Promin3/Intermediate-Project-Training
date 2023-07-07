package com.wanghao.demo.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import java.util.List;

/**
 * <p>
 * 
 * </p>
 *
 * @author 王浩
 * @since 2022-07-18
 */
@Getter
@Setter
  @TableName("t_comment")
@ApiModel(value = "Comment对象", description = "")
public class Comment implements Serializable {

    private static final long serialVersionUID = 1L;

      private Integer id;

      @ApiModelProperty("评论内容")
      private String content;

      @ApiModelProperty("评论人id")
      private Integer userId;

      @ApiModelProperty("评论时间")
      private String time;

      @ApiModelProperty("父id")
      private Integer pid;

      @ApiModelProperty("最上级评论")
      private Integer originId;

      @ApiModelProperty("关联文章的id")
      private Integer articleId;

      @TableField(exist = false)//表明数据库中不存在
      private String nickname;
      @TableField(exist = false)//表明数据库中不存在
      private String avatarUrl;
      @TableField(exist = false)//表明数据库中不存在
      private List<Comment> children;
      @TableField(exist = false)//表明数据库中不存在
      private String pNickname;
      @TableField(exist = false)//表明数据库中不存在
       private Integer pUserId;



}
