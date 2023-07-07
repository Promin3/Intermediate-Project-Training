<template>
    <div style="display: flex;flex-direction: column;align-items: center;">
        <div class="top">
            <div style="padding: 40px 0;">
                <el-input style="width:200px" placeholder="请输入资源名称" suffix-icon="el-icon-search" v-model="name"></el-input>
                <el-input style="width:200px" placeholder="请输入资源类型" suffix-icon="el-icon-search" v-model="type"></el-input>
                <el-button  style="margin-left: 10px" type="primary" @click="load">搜索</el-button>
                <el-button  style="margin-left: 10px" type="warning" @click="reset">重置</el-button>
            </div>
        </div>

        

        <!--   文章-->
        <div class="MainBodyOfArticle">
            <!--    左侧主题文章展示部分-->
            <div class="leftSide">
                <div class="recommandResources" v-for="item in tableData">
                    <!--            左侧部分-->
                    <div style="display: flex;flex-direction: column;flex: 6;justify-content: center">
                        <!--                    资源名称-->
                        <div style="flex: 1;color: #222226;font-size: 16px;font-weight: 600;padding: 0px 30px;margin: 10px 0px ">
                        <span>
                            {{item.name}}
                        </span>
                        </div>

                        <!--                    资源简介-->
                        <div style="flex: 2;font-size: 14px;color: #999aaa;padding: 0px 30px;margin: 10px 0px">
                            <sapn>
                                {{item.brief}}
                            </sapn>
                        </div>

                    </div>
                    <!--            右侧部分-->
                    <div style="flex: 2;display: flex;flex-direction: column">
                        <!--              文件大小以及下载次数  -->
                        <div style="flex: 1;display: flex;font-size: 14px;color: #999aaa;padding-top: 10px">

                            <div style="flex: 1">
                                <i class="el-icon-download"></i>
                                <span style="margin-left: 5px">下载次数{{item.downloadnumber}}</span>


                            </div>

                            <div style="flex:1">
                                <i class="el-icon-s-data"></i>
                                <span style="margin-left: 10px">大小{{item.size}}kb</span>
                            </div>
                        </div>
                        <!--                    下载按钮-->
                        <div style="flex: 1;margin-right: 30px;display: flex">
                            <div style="flex:1.5;font-size: 14px;color: #999aaa;">
                                <i class="el-icon-paperclip"></i>
                                文件类型{{item.type}}
                            </div>
                            <div style="flex: 1">
                                <el-button type="primary" class="el-icon-download"  round @click="download(item.url,item.id)">下载</el-button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--    右侧推荐部分-->
            <div class="rightSide">
                <!--推荐作者-->
                <div style="flex: 1;display: flex;flex-direction: column;background: #ffffff">
                    <!--            推荐作者标题-->
                    <div style="flex: 1;display: flex;align-items: center ;padding: 0px 30px;font-size: 16px;border-bottom: 1px solid #F2F2F2">
                        推荐作者
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

                <!--        推荐文章-->
                <div style="flex: 1.4;display: flex;flex-direction: column; background: #ffffff;height: 500px">
                    <!--                板块标题-->
                    <div style="display: flex;align-items: center; flex: 4;padding: 0px 30px;font-size: 16px;border-bottom: 1px solid #F2F2F2;height: 100px">
                        推荐文章
                    </div>
                    <!--            推荐文章信息-->
                    <div class="aaabbb" v-for="item in recommandArticle" style="flex: 6;display: flex;flex-direction: column;cursor: pointer" @click="$router.push('/front/articleDetail?id='+item.id)">
                        <div style="flex: 1;display: flex;flex-direction: column;justify-items: center">
                            <!--文章标题-->

                            <div style="flex: 2;font-size: 16px;color: #222226;font-weight: 500;overflow: hidden;text-overflow: ellipsis;padding:0px 5px;" >
                                <span style="overflow: hidden; white-space: nowrap;text-overflow: ellipsis;">{{item.name}}</span>
                            </div>
                            <!--        文章简介-->
                            <div style="font-size: 13px;color: #999aaa;flex: 2;padding: 0 5px;overflow: hidden;">
                                <span style="overflow: hidden; white-space: nowrap;text-overflow: ellipsis;">  {{item.summary}}</span>
                            </div>
                            <!--        文章信息-->
                            <div style="flex: 1;display: flex;align-items: center;font-size: 12px;color: #999aaa">
                                <!--            浏览次数-->
                                <div style="padding-left: 5px;flex: 6;">
                                    <i class="el-icon-view" style="margin-right: 5px"></i>{{item.readnumber}}
                                </div>
                                <!--            作者-->
                                <div style="padding-right: 5px">
                <span>
                    {{item.user}}
                </span>
                                    <span style="margin-left: 5px">
                    {{item.time}}
                </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div style="padding: 1px 0px;margin-right:293px; width: 1007px">
            <el-pagination
                    style="background-color: #ffffff"
                    @size-change="handleSizeChange"
                    @current-change="handleCurrentChange"
                    :current-page="pageNum"
                    :page-sizes="[7,10]"
                    :page-size="pageSize"
                    layout="total,  prev, pager, next"
                    :total="total">
            </el-pagination>
        </div>
    </div>
</template>

<script>
    import axios, {Axios as request} from "axios";

    export default {
        name: "ResourceDownload",
        data(){
            return {
                tableData: [],
                total:0,
                pageNum:1,
                pageSize:7,
                sideWidth:200,
                name:"",
                type:"",
                multipleSelection:[],
                form:{},
                dialogFormVisible:false,
                viewDialogVis: false,
                recommandUser:[],
                recommandArticle:[],
            }
        },
        created() {
            this.load()
            this.loadRecommodUser()
            this.loadRecommandArticleInfor()
        },
        methods:{
            download(url,id) {
                window.open(url)
                this.request.get("/resources/upadata/"+id);
            },
            view(content) {
                this.content = content
                this.viewDialogVis = true
            },
            loadRecommandArticleInfor(){
                this.request.get("/article/recommandArticle").then(res=>{
                    this.recommandArticle = res.data
                })
            },
            load(){
                this.request.get("/resources/page",{
                    params: {
                        pageNum: this.pageNum,
                        pageSize:this.pageSize,
                        name:this.name,
                        type:this.type
                    }
                }).then(res=>
                {
                    console.log(res)
                    this.tableData = res.records
                    this.total = res.total
                })
                //将数据转化为json
            },

            handleSizeChange(pageSize){
                // console.log(pageSize)
                this.pageSize=pageSize
                //之后请求数据
                this.load()
            },
            handleCurrentChange(pageNum){
                console.log(pageNum)
                this.pageNum=pageNum
                this.load()
            },

            reset(){
                this.name = null;
                this.type = null;
                this.load()
            },

            handleSelectionChange(val){
                this.multipleSelection = val
            },
            loadRecommodUser(){
                this.request.get("/user/recommandUser").then(res=>{
                    this.recommandUser = res.data;
                })
            }


        }
    }
</script>

<style scoped>
    .top{
        height: 100px;
        width: 100%;
        background-image: url("../../assets/micro_bg.png");
        background-position:center;
        background-size: 100%;
        text-align: center;
        margin-bottom: 10px;
    }
    .MainBodyOfArticle{

        height: 800px;
        width: 1300px;
        display: flex;
        gap: 20px;
        justify-content: center;

    }
    .leftSide{
        height: auto;
        flex: 12;
        display: flex;
        flex-direction: column;

    }
    .recommandResources{
        height: 100px;
        display: flex;
        flex: 1;
        background-color: #ffffff;
    }
    .recommandResources:hover{
        background-color: rgb(240,240,240);
    }
    .rightSide{
        flex: 3;
        gap: 20px;
        display: flex;
        flex-direction: column;
        height: 800px;
    }
    .aaabbb:hover{
        background-color: rgb(240,240,240);
    }
</style>
