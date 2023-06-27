<template>
  <div id="poster">
    <el-form class="login-container" label-position="left" label-width="0px">
      <h1>
        <img src="../assets/logo.png" style="width:250px;height:100px"/>
      </h1>
      <h3 class="login-title">
        登录
      </h3>
      <el-form-item label="">
        <el-input type="text" v-model="loginForm.loginName" placeholder="账号" prefix-icon="el-icon-user-solid"></el-input>
      </el-form-item>
      <el-form-item label="">
        <el-input type="password" v-model="loginForm.password"  placeholder="密码" prefix-icon="el-icon-lock"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="Login" style="width=100%;background: #505458;border:none">登录</el-button>
        <el-button type="primary" @click="onRegister" style="width=100%;border:none">注册</el-button>
      </el-form-item>

    </el-form>
  </div>
</template>

 <script>
export default {
  name: "Login",
  data() {
      return {
        loginForm: {
          loginName: '',
          password:'',
        }
      }
    },
    methods: {
      Login() {
        console.log('submit!',this.loginForm.loginName,this.loginForm.password);
        this.$message({
          message:'成功登录',
          type:'success'
        })
        this.$router.push({path:'/Home'})
      },
      onRegister()
      {
        this.$router.push({path:'/Register'})
      }
    }
};
</script>

<style>
#poster{
  background-position: center;
  height: 100%;
  width:100%;
  background-size: cover;
  position:fixed;
}
div{
  margin:0px;
  padding:0px;
}
.login-container{
  border-radius: 15px;
  background-clip: padding-box;
  margin:90px auto;
  width:350px;
  padding:35px 35px 15px 35px;
  background: #fff;
  border:1px solid #eaeaea;
  box-shadow: 0 0 25px #cac6c6;
}
.login-title{
  margin:0px auto 40px auto;
  text-align: center;
  color:#505458;
}
</style>