<template>
  <el-container style="height: 800px">
    <el-aside width="150px" height="100%">
      <img src="../assets/logo.png" style="height: 65px; width: 130px" />
      <el-menu router :default-active="$router.path" class="el-menu-vertical-demo" style="margin-top: 5px" @select="handleMenuSelect">
        <el-menu-item index="/Video">
          <i class="el-icon-location"></i>
          <span slot="title">兴趣推荐</span>
        </el-menu-item>
        <el-menu-item index="/Schedule">
          <i class="el-icon-menu"></i>
          <span slot="title">计划日程</span>
        </el-menu-item>
        <el-menu-item index="/Team">
          <i class="el-icon-document"></i>
          <span slot="title">组队打卡</span>
        </el-menu-item>
        <el-menu-item index="/Community">
          <i class="el-icon-setting"></i>
          <span slot="title">KG社区</span>
        </el-menu-item>
        <el-menu-item index="/Messages">
          <i class="el-icon-setting"></i>
          <span slot="title">社区消息</span>
        </el-menu-item>
        <el-menu-item index="/PersonCenter">
          <i class="el-icon-setting"></i>
          <span slot="title">个人中心</span>
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

<script>
export default {
  name: "Interests",
  methods: {
    handleMenuSelect(index) {
      // 使用 $router.push() 方法进行路由跳转
      this.$router.push(index);
    },
  },
};
</script>


<style>
.el-header {
  background-color: #b3c0d1;
  color: #333;
  line-height: 60px;
}

.el-aside {
  color: #333;
}
#app {
  height: 100%;
  margin: 0;
  padding: 0;
}
</style>