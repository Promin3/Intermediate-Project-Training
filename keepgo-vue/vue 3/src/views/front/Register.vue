<template>
    <div class="wrapper">
        <div style="margin:150px auto;background-color:  rgba(255,255,255,0.5);width: 350px;height: 400px;border-radius:10px;padding: 20px ">
            <div style="margin:20px auto;text-align: center;font-size: 24px"><b>注册</b></div>
            <el-form :model="user" :rules="rules" ref="userForm">
                <el-form-item prop="username" >
                    <el-input size="medium" style="margin: 10px auto" prefix-icon="el-icon-user"  v-model="user.username" placeholder="用户名"></el-input>
                </el-form-item>
                <el-form-item prop="password"  >
                    <el-input size="medium" style="margin: 10px auto" prefix-icon="el-icon-lock" show-password v-model="user.password" placeholder="密码"></el-input>
                </el-form-item>
                <el-form-item prop="confirmPassword"  >
                    <el-input size="medium" style="margin: 10px auto" prefix-icon="el-icon-lock" show-password v-model="user.confirmPassword" placeholder="确认密码"></el-input>
                </el-form-item>
                <div style="margin: 10px 0;text-align: center">
                    <el-button type="primary" size="small" autocomplete="off" @click="register">注册</el-button>
                    <el-button type="primary" size="small" autocomplete="off" @click="$router.push('/front/login')">返回登录</el-button>
                </div>
            </el-form>
        </div>
    </div>
</template>

<script>
    import {Axios as request} from "axios";
    import {setRoutes} from "../../router";
    export default {
        name: "Login",
        data() {
            return {
                user:{
                    // username:"",
                    // password:"",
                },
                rules: {
                    username: [
                        { required: true, message: '请输入用户名', trigger: 'blur' },
                        { min: 1, max: 7, message: '长度在 1 到 7 个字符', trigger: 'blur' }
                    ],
                    password: [
                        { required: true, message: '请输入密码', trigger: 'blur' },
                        { min: 6, max: 20, message: '长度在 6 到 20 个字符', trigger: 'blur' }
                    ],
                    confirmPassword: [
                        { required: true, message: '请再次输入密码', trigger: 'blur' },
                        { min: 6, max: 20, message: '长度在 6 到 20 个字符', trigger: 'blur' }
                    ],
                },

            }
        },

        methods:{
            register() {
                this.$refs['userForm'].validate((valid) => {
                    if (valid) {
                        if(this.user.password!=this.user.confirmPassword){
                            this.$message.error("两次输入密码不一致！")
                            return false
                        }
                        this.request.post("/user/register",this.user).then(res=>{
                            if(res.code === '200'){
                                this.$router.push('/front/login')
                                this.$store.commit("logout")
                                this.$message.success("注册成功！")
                                // setRoutes()
                            }else{
                                this.$message.error(res.msg)
                                return false;
                            }
                        })
                    } else {
                        this.$message.error("用户名或密码不符合格式要求！")
                        return false;
                    }
                });
            },

        }
    }
</script>


<style scoped>
    .wrapper{
        height: 100vh;
        overflow: hidden;
        background-image:url("../../assets/registerBg.svg");
        background-repeat:no-repeat;
        background-size:cover;
    }
</style>