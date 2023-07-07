<template>
    <div class="common-layout">
      <el-container>
        <el-header>
          <el-menu router default-active="1" class="el-menu-demo" mode="horizontal">
            <el-menu-item index="/prehome/video/video1">增肌健美</el-menu-item>
            <el-menu-item index="/prehome/video/video2">腰腹运动</el-menu-item>      
            <el-menu-item index="/prehome/video/video3">助眠冥想</el-menu-item>
            <el-menu-item index="/prehome/video/video4">耐力训练</el-menu-item>
            <el-menu-item index="/prehome/video/video5">短跑竞速</el-menu-item>
            <el-menu-item index="/prehome/video/video6">游泳</el-menu-item>
            <el-menu-item index="/prehome/video/video7">传统健身</el-menu-item>
          </el-menu>
        </el-header>
        <el-main>
          <router-view></router-view>
        </el-main>
      </el-container>
    </div>
  </template>
    