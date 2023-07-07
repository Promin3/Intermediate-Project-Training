package com.wanghao.demo.service.impl;

import com.wanghao.demo.common.Result;
import com.wanghao.demo.entity.Article;
import com.wanghao.demo.mapper.ArticleMapper;
import com.wanghao.demo.mapper.UserMapper;
import com.wanghao.demo.service.IArticleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import  java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 王浩
 * @since 2022-07-14
 */
@Service
public class ArticleServiceImpl extends ServiceImpl<ArticleMapper, Article> implements IArticleService {
    @Autowired
    private ArticleMapper articleMapper;
    public List<Article> findUsersArticle(Integer nickname){
        return  articleMapper.findUsersArticleBynickname(nickname);
    }

    public void updateArticleUserNames(){
        articleMapper.updateArticleUserName();
    }

    public void updateReadCount(Integer id){
        articleMapper.updateReadNumber(id);
    }

    public  List<Article> selectRecommandArticleLimitFive(){
     return articleMapper.selectRecommandArticle();
    }

    public  List<Article> selectCollectedArticle(Integer userid)
    {
        return articleMapper.selectCollectionArticle(userid);
    }
}
