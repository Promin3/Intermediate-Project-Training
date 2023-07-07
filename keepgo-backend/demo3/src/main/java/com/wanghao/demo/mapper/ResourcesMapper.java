package com.wanghao.demo.mapper;

import com.wanghao.demo.entity.Article;
import com.wanghao.demo.entity.Resources;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import  java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 王浩
 * @since 2022-07-27
 */
public interface ResourcesMapper extends BaseMapper<Resources> {

    @Select("SELECT * FROM resources   order by id desc limit 7")
    List<Resources> NerResourcesOfHome();

    @Update("update resources set downloadnumber = downloadnumber + 1 WHERE id = #{id}")
    void updateDownloadNumber(@Param("id") Integer id);

    @Select("select * from resources  order by downloadnumber desc  LIMIT 5")
    List<Resources> selectRecommandResources();
}
