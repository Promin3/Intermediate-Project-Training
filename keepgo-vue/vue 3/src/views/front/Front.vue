<template>
    <div  class="help_bg"  >
        <div style="background-color:#F2F2F2" >
            <div style="line-height:50px;position: sticky;top: 0px; display: flex;height: 50px;background-color: rgb(253,253,253);z-index:99" >
                <!-- <div class="logo" style="text-align: center">
                    <img src="../../assets/KGlogo.svg" height = 1000px width=100px style="margin-top: 10px">
                </div> -->
                <div class="nav">
                    <ul style="list-style: none">
                        <li><a href="/front/article">文章</a> </li>
                        <li><a href="/front/im">私信</a> </li>
                        <li><a href="/prehome">返回首页</a> </li> 
                    </ul>
                </div>
                <div class="search"  >

                </div>
                <div class="user">
                    <div v-if="!user.username">
                        <el-button type="primary" style="margin-right: 10px; margin-top:10px;height: 30px" @click="$router.push('/front/login')">登录</el-button>
                        <el-button type="primary" style="height: 30px;margin-top:10px;" @click="$router.push('/front/register')">注册</el-button>
                    </div>
                    <div v-if="user.username">
                        <div style="float: left">
                            <el-dropdown style=" width: 150px; cursor: pointer; text-align: center">
                                <div style="display: inline-block">
                                    <img :src="user.avatarUrl" alt=""
                                         style="width: 30px; height: 30px;border-radius: 50%; position: relative; top: 10px; right: 20px">
                                    <span>{{user.nickname}}</span><i class="el-icon-arrow-down" style="margin-left: 5px;margin-right: 10px"></i>
                                </div>
                                <el-dropdown-menu slot="dropdown" style="width: 100px;margin-left: 10px; text-align: center">
                                    <router-link :to="{name:'NewArticleOfPersonal', query:{ id: user.id }}" style="text-decoration: none">
                                        <el-dropdown-item style="font-size: 14px; padding: 5px 0">
                                            个人中心
                                        </el-dropdown-item>
                                    </router-link>
                                    <router-link to="/front/editMaterial/userInforEdit"  style="text-decoration: none;">
                                        <el-dropdown-item style="font-size: 14px; padding: 5px 0">
                                            <span>个人信息</span>
                                        </el-dropdown-item>
                                    </router-link>
                                    <el-dropdown-item style="font-size: 14px; padding: 5px 0">
                                        <span style="text-decoration: none" @click="logoutFront">退出</span>
                                    </el-dropdown-item>
                                </el-dropdown-menu>
                            </el-dropdown>
                        </div>

                        <div style="display: flex;margin-right: 60px">
                            <el-dropdown>
                                <el-button  type="primary" style="height: 30px" round>
                                    <i class="el-icon-edit" style="padding-right:10px " placement="bottom-start">  创作中心</i>
                                </el-button>
                                <el-dropdown-menu slot="dropdown" style="width: 160px;height: 80px;">

                                    <div style="float: left;height: 100%;width: 50%;text-align: center;border-right: #cccccc 2px solid;cursor: pointer" @click="articleRelease">
                                        <div style="height: 40px;width: 40px; margin-left: 20px;margin-top: 10px;text-align: center">
                                            <img src="../../assets/maobi.png" style="margin: 0px auto;">
                                        </div>
                                        <div>
                                            <span style="color: #409EFF;font-size: 10px;text-align: center" >发布文章</span>
                                        </div>
                                    </div>
                                    <!--                           resourceUpload-->


                                    <li style="display: block; float: left;height: 100%;width: 50%;text-align: center;cursor: pointer;cursor: pointer">
                                        <a href="https://github.com/Promin3/Intermediate-Project-Training" style="text-decoration: none">
                                            <div style="height: 40px;width: 40px; margin-left: 20px;margin-top: 10px;text-align: center;">
                                                <img src="../../assets/uploadUser.png" style="margin: 0px auto">
                                            </div>
                                            <div>
                                                <span style="color: #409EFF;font-size: 10px;text-align: center" >关于我们</span>
                                            </div>
                                        </a>
                                    </li>

                                </el-dropdown-menu>
                            </el-dropdown>
                        </div>

                    </div>
                </div>


            </div>
            <div >
                <router-view @grandFatherRefreshInfo="grandFatherRefreshInfo" />
            </div>

        </div>
    </div>

</template>

<script>
    import {Axios as request} from "axios";
    export default {
        name: "Front",
        data(){
            return {
                user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {username:""},
                input:"",
            }
        },
        methods:{
            logoutFront() {
                this.$store.commit("logoutFront")
                this.$message.success("退出成功")
            },
            articleRelease(){
                this.$router.push("/release")
            },
            grandFatherRefreshInfo(){
                let username = JSON.parse(localStorage.getItem("user")).username
                this.request.get("/user/username/"+username).then(res =>{
                    this.user = res.data
                    localStorage.removeItem("user")
                    localStorage.setItem("user",JSON.stringify(res.data))
                })
            }
        }
    }
</script>

<style scoped>
    .help_bg{background: rgb(245,246,247);position: absolute;
        height: 100%;
        width: 100%;
        top:0;
        left: 0;
        overflow-y: auto;

    }

.logo{
    width: 100px;
    margin-left:50px ;
    text-align: center;
    line-height: 50px;
}
    .nav{
        flex:1;
        margin-left: 20px;

    }
    .nav li{
        text-align: center;
        display: inline-block;
        height: 50px;
        width: 100px;
        margin-left: 10px;
    }
.nav ul li a:hover{
    border-bottom: 2px solid #00a4ff;
    color:#00a4ff ;
}
    .nav ul li :active{
        border-bottom: 2px solid #00a4ff;
        color:#00a4ff ;
    }
    .nav ul li a{
        display: inline-block;
        float: left;
        color: #000;
        height: 100%;
        width: 100%;
    text-decoration: none;
}
    .search{
        display: flex;
        width: 300px;
        text-align: center;
        margin-left: 40px;
    }
    .user{
        display: flex;
        flex: 0.5;
        margin-left: 200px;
    }
</style>