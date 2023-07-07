package com.wanghao.demo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * <p>
 * 
 * </p>
 *
 * @author 王浩
 * @since 2022-07-16
 */
@Data
@TableName("carousel")
public class Carousel {



        @TableId(value = "id", type = IdType.AUTO)
      private Integer id;


      private String name;


      private String content;


      private String url;

      private String user;

      private String time;

      private String enable;

      private  String md5;


}
