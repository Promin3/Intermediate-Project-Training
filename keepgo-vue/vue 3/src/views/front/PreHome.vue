<template>
    <el-container >  
      <el-aside width="200px">
  
        <div style="display: flex; justify-content: center; align-items: center;">
            <img src="../../assets/KGlogo.svg" style="height: 85px; width: 180px" />
        </div>
  
        <el-menu router default-active="/video" class="el-menu-vertical-demo" style="margin-top: 15px">
          
          <el-menu-item index="/prehome/video"> &nbsp;&nbsp;&nbsp;
            <span>兴趣推荐</span>
          </el-menu-item>
          
          <el-menu-item index="/prehome/schedule"> &nbsp;&nbsp;&nbsp;
            <span>健身计划</span>
          </el-menu-item>
  
          <el-menu-item index="/front/article"> &nbsp;&nbsp;&nbsp;
            <span>前往KG社区</span>
          </el-menu-item>
        </el-menu>
    
      
      </el-aside>
  
      <el-container>
          <el-main>
            <router-view></router-view>
          </el-main>
      </el-container>
      
    </el-container>
  
  
  </template>
  
  
  
  <style scoped>
  .el-menu {
      border-right:0!important;
  }
  
  </style>
  