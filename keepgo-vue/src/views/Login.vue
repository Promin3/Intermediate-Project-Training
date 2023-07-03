<template>
    <div style="display: flex; justify-content: center; align-items: center;">
          <img src="../assets/keepgo.svg" style="height: 680px; width: 680px" />
      </div>
      <br><br>   <br><br>   <br><br><br>
    <el-row :gutter="20">
        <el-col :span="12" :offset="6">

            <el-card class="box-card">
                <template #header>
                    <div class="card-header">
                        <span>登录KeepGo平台</span>
                    </div>
                </template>

                <el-form ref="ruleFormRef" :model="ruleForm" status-icon label-width="120px" class="demo-ruleForm">
                    <el-form-item label="账号" prop="account">
                        <el-input v-model="ruleForm.pass" type="text" autocomplete="off" style="width: 300px;"/>
                    </el-form-item>
                    <el-form-item label="密码" prop="password">
                        <el-input v-model="ruleForm.checkPass" type="password" autocomplete="off" style="width: 300px;"/>
                    </el-form-item>

                    <el-form-item>
                        <el-button type="primary" @click="submitForm(ruleFormRef)">登录</el-button>
                        <el-button @click="registerForm(ruleFormRef)">注册</el-button>
                    </el-form-item>
                </el-form>

            </el-card>
            <br><br>  <br><br>  <br><br>   <br><br>  <br><br>   <br><br>  
        </el-col>
    </el-row>
</template>

<script>

import { useRouter } from 'vue-router';
export default {
    data() {
        return {
            ruleForm: {
                account: '',
                password: ''
            },
            router:useRouter()
        }
    },
    methods: {
        submitForm(ruleFormRef) {
            this.router.push({
                path:'/home'
            })
        },
        registerForm(ruleFormRef){
            this.router.push({
                path:'/register'
            })
        }
    }
}
</script>


<style scoped>
.card-header {
    display: flex;
    justify-content: center;
}
.el-form-item .el-button {
  position: relative;
  left: 30%;
  transform: translateX(-50%);
}
</style>