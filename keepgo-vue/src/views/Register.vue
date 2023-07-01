<template>
    <div style="display: flex; justify-content: center; align-items: center;">
          <img src="../assets/register.svg" />
      </div>
      <br>
    <el-row :gutter="20">
        <el-col :span="12" :offset="6">

            <el-card class="box-card">
                <template #header>
                    <div class="card-header">
                        <span>注册账号</span>
                    </div>
                </template>

                <el-form ref="ruleFormRef" 
                :model="ruleForm" 
                :rules="rules"
                status-icon 
                label-width="120px" 
                class="demo-ruleForm">

                    <el-form-item label="手机号" prop="phone">
                        <el-input v-model="ruleForm.phone" type="text" autocomplete="off" />
                    </el-form-item>
                    <el-form-item label="密码" prop="password">
                        <el-input v-model="ruleForm.password" type="password" autocomplete="off" />
                    </el-form-item>
                    <el-form-item label="确认密码" prop="confirmPassword">
                        <el-input v-model="ruleForm.confirmPassword" type="password" autocomplete="off" />
                    </el-form-item>
                    <el-form-item>
                        <el-button type="primary" @click="submitForm(ruleFormRef)">注册</el-button>
                    </el-form-item>
                </el-form>


            </el-card>
        </el-col>
    </el-row>
</template>


<script lang="ts" setup>
import { reactive, ref } from 'vue'
import type { FormInstance, FormRules } from 'element-plus'
import { useRouter } from 'vue-router';


const ruleFormRef = ref<FormInstance>()

const ruleForm = reactive({
  phone: '',
  password: '',
  confirmPassword: '',
})

const checkPhone = (rule, value, callback) => {
  if (!value) {
    return callback(new Error('请输入手机号'));
  }

  const phoneNumber = String(value).trim();

  if (!/^\d{11}$/.test(phoneNumber)) {
    return callback(new Error('请输入有效的11位手机号'));
  }

  callback();
};


const validatePass = (rule: any, value: any, callback: any) => {
  if (value === '') {
    callback(new Error('请输入密码'))
  } else {
    if (ruleForm.confirmPassword !== '') {
      if (!ruleFormRef.value) return
      ruleFormRef.value.validateField('checkPass', () => null)
    }
    callback()
  }
}

const validatePass2 = (rule: any, value: any, callback: any) => {
  if (value === '') {
    callback(new Error('请再次输入密码'))
  } else if (value !== ruleForm.password) {
    callback(new Error("两次密码输入不一致"))
  } else {
    callback()
  }
}

const rules = reactive<FormRules<typeof ruleForm>>({
  phone: [{ validator: checkPhone, trigger: 'blur' }],
  password: [{ validator: validatePass, trigger: 'blur' }],
  confirmPassword: [{ validator: validatePass2, trigger: 'blur' }],
})

const router = useRouter()

const submitForm = (formEl: FormInstance | undefined) => {
  if (!formEl) return
  formEl.validate((valid) => {
    if (valid) {
      console.log('注册成功!')
      router.push('/') // 跳转到登录页面
    } else {
      console.log('注册失败!')
      return false
    }
  })
}

</script>


<style scoped>
.card-header {
    display: flex;
    justify-content: center;
}
.el-form-item .el-button {
  position: relative;
  left: 35%;
  transform: translateX(-50%);
}
</style>