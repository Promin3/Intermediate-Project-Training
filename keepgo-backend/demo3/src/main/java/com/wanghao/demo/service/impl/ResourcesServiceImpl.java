package com.wanghao.demo.service.impl;

import com.wanghao.demo.entity.Resources;
import com.wanghao.demo.mapper.ResourcesMapper;
import com.wanghao.demo.service.IResourcesService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 王浩
 * @since 2022-07-27
 */
@Service
public class ResourcesServiceImpl extends ServiceImpl<ResourcesMapper, Resources> implements IResourcesService {
    @Resource
    private ResourcesMapper resourcesMapper;
//    首页最新资源
    public List<Resources> newResourcesOfhome(){
       return resourcesMapper.NerResourcesOfHome();
    }
//    更新下载次数
    public void upadateDownloadNumber(Integer id){
        resourcesMapper.updateDownloadNumber(id);
    }
//    获取推荐文章列表
    public List<Resources> getRecommandResours(){
      return  resourcesMapper.selectRecommandResources();
    }
}
