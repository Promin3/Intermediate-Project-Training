package com.wanghao.demo.mapper;

import com.wanghao.demo.entity.Article;
import com.wanghao.demo.entity.Type;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import  java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 王浩
 * @since 2022-07-24
 */
public interface TypeMapper extends BaseMapper<Type> {
        @Select("select a.*  from article a left join type t on t.id = a.typeid where t.name = #{name}")
         List<Article> findALLInforOfArticleByTypeName(@Param("name")  String name);

         @Select("select a.*  from article a left join type t on t.id = a.typeid where t.id = #{id} limit 3")
         List<Article> findALLInforOfArticleByTypeNameLimit(@Param("id")  Integer id);
}
