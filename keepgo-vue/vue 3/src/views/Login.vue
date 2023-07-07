<template>
    <div class="wrapper">
        <div style="margin:200px auto;background-color: #fff;width: 350px;height: 300px;border-radius:10px;padding: 20px ">
            <div style="margin:20px auto;text-align: center;font-size: 24px"><b>管理员登录</b></div>
            <el-form :model="user" :rules="rules" ref="userForm">
                <el-form-item prop="username" >
                    <el-input size="medium" style="margin: 10px auto" prefix-icon="el-icon-user"  v-model="user.username" placeholder="用户名"></el-input>
                </el-form-item>
                <el-form-item prop="password"  >
                    <el-input size="medium" style="margin: 10px auto" prefix-icon="el-icon-lock" show-password v-model="user.password" placeholder="密码"></el-input>
                </el-form-item>
                <div style="margin: 10px 0;text-align: center">
                <el-button type="primary" size="small" autocomplete="off" @click="login">登录</el-button>
                </div>
            </el-form>
        </div>
    </div>
</template>

<script>
    import {Axios as request} from "axios";
    import {setRoutes} from "../router";
    export default {
        name: "Login",
        data() {
            return {
                user:{
                    // username:"",
                    // password:"",
                    role:"管理员"
                },
            rules: {
                username: [
                    { required: true, message: '请输入用户名', trigger: 'blur' },
                    { min: 1, max: 7, message: '长度在 1 到 7 个字符', trigger: 'blur' }
                ],
                    password: [
                    { required: true, message: '请输入密码', trigger: 'blur' },
                    { min: 6, max: 20, message: '长度在 6 到 20 个字符', trigger: 'blur' }
                ]},
            }
        },

        methods:{
            login() {
                this.$refs['userForm'].validate((valid) => {
                    if (valid) {
                        this.request.post("/user/adminLogin",this.user).then(res=>{
                            if(res.code === '200'){
                                localStorage.setItem("user",JSON.stringify(res.data))
                                localStorage.setItem("menus", JSON.stringify(res.data.menus))
                                setRoutes()
                                this.$message.success("登陆成功！")
                                this.$router.push("/")
                            }else{
                                console.log(res.code)
                                this.$message.error(res.msg)
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
    background-image: linear-gradient(to bottom right,rgb(97,222,251),rgb(	238 ,180 ,180));
}
</style>