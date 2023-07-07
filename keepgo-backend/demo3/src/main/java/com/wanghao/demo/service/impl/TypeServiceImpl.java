package com.wanghao.demo.service.impl;

import com.wanghao.demo.entity.Article;
import com.wanghao.demo.entity.Type;
import com.wanghao.demo.mapper.TypeMapper;
import com.wanghao.demo.service.ITypeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 王浩
 * @since 2022-07-24
 */
@Service
public class TypeServiceImpl extends ServiceImpl<TypeMapper, Type> implements ITypeService {
    @Resource
    private TypeMapper typeMapper;
    public List<Article> FindALLInfor(String name)
    {
        return typeMapper.findALLInforOfArticleByTypeName(name);
    }

    public List<Article> FindLimitNumberArticle(Integer id)
    {
        return typeMapper.findALLInforOfArticleByTypeNameLimit(id);
    }
}
