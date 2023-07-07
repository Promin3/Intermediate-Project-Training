package com.wanghao.demo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import java.util.List;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 
 * </p>
 *
 * @author 王浩
 * @since 2022-07-24
 */
@Getter
@Setter
  @ApiModel(value = "Type对象", description = "")
public class Type implements Serializable {

    private static final long serialVersionUID = 1L;

      @ApiModelProperty("文章类型id")
        @TableId(value = "id", type = IdType.AUTO)
      private Integer id;

      @ApiModelProperty("文章类型名称")
      private String name;

      @ApiModelProperty("文章类型概述")
      private String content;

      @ApiModelProperty("专题背景图片")
      private String url;

      @TableField(exist = false)//表明数据库中不存在  每个专题拿三个例子
      private List<Article> children;


}
