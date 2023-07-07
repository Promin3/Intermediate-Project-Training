package com.wanghao.demo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
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
 * @since 2022-07-27
 */
@Getter
@Setter
  @ApiModel(value = "Resources对象", description = "")
public class Resources implements Serializable {

    private static final long serialVersionUID = 1L;

      @TableId(value = "id", type = IdType.AUTO)
      private Integer id;

      @ApiModelProperty("资源名称")
      private String name;

      @ApiModelProperty("上传人id")
      private Integer userid;

      @ApiModelProperty("文件类型")
      private String type;

      @ApiModelProperty("文件大小")
      private Long size;

      @ApiModelProperty("文章下载次数")
      private Integer downloadnumber;

      @ApiModelProperty("文件MD5")
      private String md5;

      @ApiModelProperty("下载链接")
      private String url;

      @ApiModelProperty("资源描述")
      private String brief;


}
