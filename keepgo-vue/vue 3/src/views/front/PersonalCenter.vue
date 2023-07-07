<template>
    <div class="personalCenterView">
<!--        最顶部-->
        <div class="topbar">
<!--            顶部图片-->
            <div class="imageOfTop">
                <img src="../../assets/csdnimg.png" style="height: 100%;width: 100%">
            </div>
<!--            用户信息展示-->
            <div class="userBaseInfor">
<!--                头像区域-->
                <div class="avaOfPersonalCenter">
                    <div class="avatarOfUser" style="width: 100px;height: 100px;position: relative;top: -30px">
                        <img :src="personalInfor.avatarUrl" style="width: 100%;height: 100%;border-radius: 50%;">
                    </div>
                </div>
<!--                基本信息区域-->
                <div class="baseInformation">
<!--                    用户名区域-->
                    <div class="nicknameOfpersonal" style="flex: 1;">
                        <span style="flex: 1;line-height: 47px;padding-left: 20px;color: #222226; font-size: 22px">{{personalInfor.nickname}}</span>
                        <span class="el-icon-message" style="padding-left: 15px;font-size: 12px;"></span>
                        <span style="flex: 13;line-height: 47px;padding-left: 5px;color: #222226; font-size: 12px;color: #999AAA">{{personalInfor.email}}</span>
                    </div>
<!--                    数据显示区域-->
                    <div class="dataView" style="color: #999aaa; flex: 1;display: flex;justify-content: center;align-items: center;font-size: 14px;letter-spacing: 1px;">
                        <div style="text-align: center;flex: 1;border-right: 1px solid #F2F2F2;">
                            <span style="font-size: 16px;font-weight: bold"> {{personalInfor.count}}</span>文章数量
                        </div>
                        <div style="text-align: center;flex: 1;border-right: 1px solid #F2F2F2">
                             <span style="font-size: 16px;font-weight: bold"> {{readNumber}}</span>被浏览量
                        </div>
                        <div style="text-align: center;flex: 1;border-right: 1px solid #F2F2F2">
                          <span style="font-size: 16px;font-weight: bold">{{collectedNumber}}</span>被收藏量
                        </div>
                        <div style="text-align: center;flex: 4">
                        </div>
                    </div>
<!--                    资料折叠区域-->
                    <div class="collapse_view" style="flex:1;margin-left: 10px;background-color: black;color: #555666">
                        <el-collapse v-model="activeName" accordion >
                            <el-collapse-item title="点击查看更多信息" name="1" style="background-color:#555666 ;">
                                <div style="color: #999aaa;letter-spacing: 1px;"><i class="el-icon-phone-outline"></i> 电话:{{personalInfor.phone}}</div>
                                <div style="color: #999aaa;letter-spacing: 1px;"><i class="el-icon-office-building"></i> 地址:{{personalInfor.address}}</div>
                            </el-collapse-item>
                        </el-collapse>
                    </div>
                </div>
<!--                按钮区域-->
                <div class="buttonArea">
                    <el-button v-if="id==user.id"  class="el-icon-tickets" round type="primary" style="  letter-spacing: 1px;height: 40px" @click="pushIntoEditView">编辑资料</el-button>
                </div>
            </div>
        </div>




<!--        用户文章及其他内容展示-->
        <div class="resourcesOfPersonal">
<!--            左侧边栏-->
            <div class="leftAside">
<!--                评分区域-->
                <div class="score" style="flex: 1">
                    <el-card class="box-card" shadow="never">
                        <div slot="header" class="clearfix" style="text-align: center;display: flex;align-items: center;justify-content: center">
                            <img src="../../assets/xiaolian.png">
                            <span style="padding-left: 5px" >客官给我们打个分吧</span>
                        </div>
                        <div class="block" @change="rateChange" style="text-align: center; letter-spacing: 15px;">
                            <el-rate v-model="score"></el-rate>
                        </div>
                    </el-card>
                </div>
<!--               暂定区域 -->
                <div style="flex: 5;">
                    <div style="display: flex;flex-direction: column;background: #ffffff">
                        <!--            推荐作者标题-->
                        <div style="flex: 1;display: flex;align-items: center ;padding: 0px 30px;font-size: 16px;border-bottom: 1px solid #F2F2F2">
                           <div>
                               推荐作者
                           </div>
                        </div>
                        <!--           作者列表-->
                        <div style="flex: 6;flex-direction: column;">
                            <div v-for="item in recommandUser" style="flex: 1;display: flex;padding: 2px 10px">

                                <!--                头像-->
                                <div style="flex: 2">
                                    <el-image :src="item.avatarUrl" style="width: 45px; height: 45px; border-radius: 50%;flex: 1;cursor: pointer " @click="$router.push('/front/personalCenter/newArticleOfPersonal?id='+item.id)" ></el-image>
                                </div>
                                <!--                网名和信息-->
                                <div style="flex: 6;display: flex;flex-direction: column;justify-items: center">
                                    <!--                    nickname-->
                                    <div style="flex: 1;color: #222226;font-size: 14px">
                                        {{item.nickname}}
                                    </div>
                                    <!--                    简介-->
                                    <div style="flex: 2;color: #999aaa;font-size: 12px;padding-top: 5px; padding-left: 5px;padding-right: 5px ;overflow: hidden">
                                        {{item.brief}}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
<!--            用户的资源展示-->
            <div class="resources">
                    <div>
                        <el-menu
                                :default-active="'/front/personalCenter/newArticleOfPersonal'"
                                 class="el-menu-demo"
                                 mode="horizontal"
                                 router
                                 @select="handleSelect"
                        >

                            <el-menu-item
                                    index="/front/personalCenter/newArticleOfPersonal"
                                    :route="{name:'NewArticleOfPersonal',query:{id:this.id}}"
                            >最新文章</el-menu-item>
                            <!-- <el-menu-item
                                    index="/front/personalCenter/newResoucesView"
                                    :route="{name:'NewResoucesView',query:{id:this.id}}"
                            >最新资源</el-menu-item> -->
                            <el-menu-item  index="/front/personalCenter/personalCollectView"
                                           :route="{name:'PersonalCollectView',query:{id:this.id}}" >收藏</el-menu-item>
                        </el-menu>
                    </div>
                <div>
                    <router-view/>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "PersonalCenter",
        data(){
            return{
                user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {},
                drawer: false,
                score:5,
                proposal:false,
                id:this.$route.query.id,
                personalInfor:localStorage.getItem("personalInfor") ? JSON.parse(localStorage.getItem("personalInfor")) : {},
                recommandUser:[],
                readNumber:0,
                collectedNumber:0,
            }
        },
        created() {
            this.loadPersonalInfor()
            this.loadRecommodUser()
            this.loadReadNumber()
            this.loadCollectedNumber()
        },
        methods:{
            loadRecommodUser(){
                this.request.get("/user/recommandUser").then(res=>{
                    this.recommandUser = res.data;
                })
            },
            rateChange(value) {
                console.log(value);
            },
            loadPersonalInfor(){
                this.request.get("/user/PersonalCenter/"+this.id).then(res=>{
                        this.personalInfor = res.data
                        localStorage.removeItem("personalInfor")
                        localStorage.setItem("personalInfor",JSON.stringify(res.data))
                })
            },
            pushIntoEditView(){
                 this.$router.push('/front/editMaterial/userInforEdit')
            },
            loadReadNumber()
            {
                this.request.get("/user/findReadNumber/"+this.id).then(res=>{
                   this.readNumber =  res.data
                })
            },
            loadCollectedNumber(){
                this.request.get("/user//findCollectionNumber/"+this.id).then(res=>{
                    this.collectedNumber = res.data
                })
            }
        }
    }
</script>

<style scoped>
    .personalCenterView{
        gap: 10px;
        display: flex;
        flex-direction: column;
        align-items: center;
        height: 1000px;
    }
    .topbar{
        width: 2000px;
        flex: 3;
        display: flex;
        flex-direction: column;
        align-items: center;


    }
    .imageOfTop{

        flex: 1;
    }
    .userBaseInfor{
        width: 1200px;
        display: flex;
        flex: 1;
    }
    .score{

    }
    .resourcesOfPersonal{
        gap: 10px;
        width: 1200px;
        justify-content: center;
        display: flex;
        flex: 13;
    }
    .leftAside{

        flex-direction: column;
        display: flex;
        gap: 10px;
        flex: 3;

    }
    .resources{
        flex: 10;
    }
    .avaOfPersonalCenter{
        display: flex;
       justify-content: center;
        flex: 2;
        background-color: #FFFFFF;
    }
    .baseInformation{
        background-color: #FFFFFF;
        justify-content: center;
        display: flex;
        flex-direction: column;
        flex: 10;

    }
    .buttonArea{
        display: flex;
        align-items: center;
        justify-content: center;
        flex: 3;
        background-color:#FFFFFF;
    }
    .collapse_view{
        height: auto;
    }
    .collapse_view:hover{
        color: #00a4ff;
    }

</style>