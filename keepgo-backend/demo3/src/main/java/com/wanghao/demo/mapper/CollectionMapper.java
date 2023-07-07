package com.wanghao.demo.mapper;

import com.wanghao.demo.entity.Collection;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import  java.util.List;
/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 王浩
 * @since 2022-07-26
 */
public interface CollectionMapper extends BaseMapper<Collection> {
    @Select("select * from collection where userid = #{userid}")
    List<Collection> getCollectInformationByUserid(@Param("userid")  Integer userid);


    @Select("select articleid from collection where userid = #{userid}")
    List<Integer> getarticleIdonByUserid(@Param("userid")  Integer userid);

    @Delete("delete FROM collection where articleid=#{articleid} and userid=#{userid} ")
    void removeByUseridAndArticleId(@Param("articleid") Integer articleid,@Param("userid") Integer userid );
}
