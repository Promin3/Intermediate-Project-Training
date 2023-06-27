<template>
  <div id="poster">
    <el-form
      :model="ruleForm"
      :rules="rules"
      ref="ruleForm"
      label-width="0px"
      label-position="left"
      class="register-container"
    >
      <h1>
        <img src="../assets/logo.png" style="width: 250px; height: 100px" />
      </h1>
      <h3 class="register-title">系统注册</h3>
      <el-form-item label="" prop="LoginName">
        <el-input
          type="text"
          v-model.number="ruleForm.LoginName"
          placeholder="请输入用户名"
          prefix-icon="el-icon-user-solid"
        ></el-input>
      </el-form-item>
      <el-form-item label="" prop="password">
        <el-input
          type="password"
          v-model="ruleForm.password"
          autocomplete="off"
          placeholder="请输入密码"
          prefix-icon="el-icon-lock"
        ></el-input>
      </el-form-item>
      <el-form-item label="" prop="checkPass">
        <el-input
          type="password"
          v-model="ruleForm.checkPass"
          autocomplete="off"
          placeholder="请确认密码"
          prefix-icon="el-icon-lock"
        ></el-input>
      </el-form-item>
      <el-form-item>
        <el-button
          type="primary"
          style="width=100%;background: #505458;border:none"
          @click="submitForm('ruleForm')"
          >注册</el-button
        >
        <el-button @click="resetForm('ruleForm')">重置</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
export default {
  name: "Register",
  data() {
    var validatePass = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入密码"));
      } else {
        if (this.ruleForm.checkPass !== "") {
          this.$refs.ruleForm.validateField("checkPass");
        }
        callback();
      }
    };
    var validatePass2 = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请再次输入密码"));
      } else if (value !== this.ruleForm.password) {
        callback(new Error("两次输入密码不一致!"));
      } else {
        callback();
      }
    };
    return {
      ruleForm: {
        LoginName: "",
        password: "",
        checkPass: "",
      },
      rules: {
        LoginName: [
          { required: true, message: "请输入你的用户名", trigger: "blur" },
          { min: 2, max: 9, message: "长度2~9个字符", trigger: "blur" },
        ],
        password: [{ validator: validatePass, trigger: "blur" }],
        checkPass: [{ validator: validatePass2, trigger: "blur" }],
      },
    };
  },
  methods: {
    submitForm(formName) {},
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
  },
};
</script>

<style>
#poster {
  background-position: center;
  height: 100%;
  width: 100%;
  background-size: cover;
  position: fixed;
  margin: 0px;
  padding: 0px;
}

.register-container {
  border-radius: 15px;
  background-clip: padding-box;
  margin: 90px auto;
  width: 350px;
  padding: 35px 35px 15px 35px;
  background: #fff;
  border: 1px solid #eaeaea;
  box-shadow: 0 0 25px #cac6c6;
}
.register-title {
  margin: 0px auto 40px auto;
  text-align: center;
  color: #505458;
}
</style>