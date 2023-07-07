import request

<template xmlns:cursor="http://www.w3.org/1999/xhtml">


  <el-container style="height: 100vh;">
<!--    Aside  -->
    <el-aside :width="sideWidth+'px'" style=" height:100vh; background-color: rgb(238, 241, 246);overflow: visible">
      <Aside  :isCollapse="isCollapse"  :logal-text-show="logalTextShow"/>
    </el-aside>
<!--header-->
    <el-container>
      <el-header style=" border-bottom:1px solid #ccc;">
        <Header :collapseBtnClass="collapseBtnClass" :collapse="collapse" :user="user" />
      </el-header>


<!--main-->
      <el-main>

       <router-view @refreshUser ="getUser" />
      </el-main>



    </el-container>
  </el-container>

</template>

<script>
import Aside from "../components/Aside";
import Header from "../components/Header";

export default {
  data() {
    return {
      collapseBtnClass:'el-icon-s-fold',
      isCollapse:false,
      sideWidth:200,
      logalTextShow:true,
      //默认不展示
      user:{}
    }
  },

  components: {
    Aside,
    Header
  },
    created() {
      this.getUser()
    },
    methods:{
      collapse(){
        this.isCollapse = !this.isCollapse
          if(this.isCollapse){
              //收缩
              this.sideWidth=64
              this.collapseBtnClass = "el-icon-s-unfold"
              this.logalTextShow = false
          }else{
              //展开
              this.sideWidth=200
              this.collapseBtnClass = "el-icon-s-fold"
              this.logalTextShow = true
          }
      },
        getUser(){
        let username = JSON.parse(localStorage.getItem("user")).username
        this.request.get("/user/username/"+username).then(res =>{
            this.user = res.data
        })
        }
  }
}
</script>
