<template>
 <!-- <div class="common-layout"> -->
  <el-container >  
    <el-aside width="200px">

      <div style="display: flex; justify-content: center; align-items: center;">
          <img src="../../assets/KGlogo.svg" style="height: 85px; width: 180px" />
      </div>

      <el-menu router default-active="/video" class="el-menu-vertical-demo" style="margin-top: 15px">
        
        <el-menu-item index="/home/video"> &nbsp;&nbsp;&nbsp;
          <el-icon :size="100"><VideoCameraFilled /></el-icon> &nbsp;&nbsp;&nbsp;
          <span>兴趣推荐</span>
        </el-menu-item>
        
        <el-menu-item index="/home/schedule"> &nbsp;&nbsp;&nbsp;
          <el-icon :size="100"><List /></el-icon> &nbsp;&nbsp;&nbsp;
          <span>计划日程</span>
        </el-menu-item>

        <el-menu-item index="/home/team"> &nbsp;&nbsp;&nbsp;
          <el-icon :size="100"><CircleCheckFilled /></el-icon> &nbsp;&nbsp;&nbsp;
          <span>组队打卡</span>
        </el-menu-item>

        <el-menu-item index="/home/community"> &nbsp;&nbsp;&nbsp;
          <el-icon :size="100"><HomeFilled /></el-icon>&nbsp;&nbsp;&nbsp;
          <span>KG社区</span>
        </el-menu-item>

        <el-menu-item index="/home/messages">&nbsp;&nbsp;&nbsp;
          <el-icon :size="100"><Promotion /></el-icon>&nbsp;&nbsp;&nbsp;
          <span>社区消息</span>
        </el-menu-item>

        <el-menu-item index="/home/person">&nbsp;&nbsp;&nbsp;
          <el-icon :size="100"><Avatar /></el-icon>&nbsp;&nbsp;&nbsp;
          <span>个人中心</span>
        </el-menu-item>
      </el-menu>
  
    
    </el-aside>

    <el-container>
        <el-main>
          <RouterView></RouterView>
        </el-main>
    </el-container>
    
  </el-container>

<!-- </div> -->
</template>


<script lang="ts" setup>
import {
  VideoCameraFilled ,
  List,
  CircleCheckFilled ,
  HomeFilled,
  Promotion,
  Avatar 
} from '@element-plus/icons-vue'

</script>

<style scoped>
.el-menu {
	border-right:0!important;
}

</style>
