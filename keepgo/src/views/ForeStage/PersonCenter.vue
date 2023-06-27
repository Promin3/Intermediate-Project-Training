<template>
  <div>
    <el-row >
      <el-col :span="12" type=“flex” align=“middle”
        ><div class="grid-content bg-purple-light">
          <el-avatar :src="circleUrl"></el-avatar></div
      ></el-col>
    </el-row>
    <el-row :gutter="20">
        <el-col :span="8"
        ><div class="grid-content1 bg-purple">积分数：</div
      ></el-col>
      <el-col :span="8"
        ><div class="grid-content1 bg-purple">积分排行：</div
      ></el-col>
      <el-col :span="8"
        ><div class="grid-content1 bg-purple">头衔：</div
      ></el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :span="6"
        ><div class="grid-content bg-purple-light"></div
      ></el-col>
      <el-col :span="6"
        ><div class="grid-content bg-purple-light"></div
      ></el-col>
      <el-col :span="6"
        ><div class="grid-content bg-purple-light"></div
      ></el-col>
      <el-col :span="6"
        ><div class="grid-content bg-purple-light"></div
      ></el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :span="6"
        ><div class="grid-content bg-purple-light"></div
      ></el-col>
      <el-col :span="6"
        ><div class="grid-content bg-purple-light"></div
      ></el-col>
      <el-col :span="6"
        ><div class="grid-content bg-purple-light"></div
      ></el-col>
      <el-col :span="6"
        ><div class="grid-content bg-purple-light"></div
      ></el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  data() {
    return {
      circleUrl:
        "https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png",
      squareUrl:
        "https://cube.elemecdn.com/9/c2/f0ee8a3c7c9638a54940382568c9dpng.png",
    };
  },
};
</script>

<style>
.el-row {
  margin-bottom: 20px;
}
.el-row:last-child {
  margin-bottom: 0;
}
.el-col {
  border-radius: 4px;
}
.bg-purple-dark {
  background: #99a9bf;
}
.bg-purple {
  background: #d3dce6;
}
.bg-purple-light {
  background: #e5e9f2;
}
.grid-content {
  border-radius: 4px;
  min-height: 200px;
}
.grid-content1 {
  border-radius: 4px;
  min-height: 50px;
}
.row-bg {
  padding: 10px 0;
  background-color: #f9fafc;
}
.el-avatar{
    margin-top: 50px;
    size: 100;
}
</style>