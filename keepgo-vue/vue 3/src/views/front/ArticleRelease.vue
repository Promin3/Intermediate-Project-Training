<template xmlns:placehoder="http://www.w3.org/1999/xhtml">
    <div style="position: absolute;width: 100%;height: 100%;" >

    <div style="position: sticky;top:0px;z-index: 999">
        <div style="height: 60px;background-color: rgb(251,251,251);">
            <div class="PersonalCenter">
                <!-- <a href="/front/editMaterial/ArticleCommand" > <i class="el-icon-arrow-left"></i> 文章管理</a> -->
                <a href="/front" ><i class="el-icon-arrow-left"></i>返回首页</a>
            </div>
            <div class="title">
                <input v-model="article.name" type="text" ></input>
            </div>
            <div class="release">

                <el-popconfirm
                        confirm-button-text='确定'
                        cancel-button-text='我再想想'
                        icon="el-icon-info"
                        icon-color="#3F5EFB"
                        title="您确认发表这篇文章吗？"
                        @confirm="ArticleRelease"

                >
                     slot="reference"
                </el-popconfirm>
                    <el-button type="primary" style="width: 100px;height: 40px;border-radius: 23px;font-size: 14px;margin-left: 10px"  @click="handleEdit"><i class="el-icon-position" ></i> 发布文章</el-button>



            </div>

            <!-- <div class="touxiang" >
                <el-dropdown style=" cursor: pointer; text-align: center" placement="bottom">
                    <div style="display: inline-block">
                        <img :src="user.avatarUrl" alt=""
                             style="width: 40px; height: 40px;border-radius: 50%;margin-top: 10px">
                    </div>
                    <el-dropdown-menu slot="dropdown" style="width: 100px;margin-left: 10px; text-align: center">
                        <router-link to="/front/editMaterial/ArticleCommand" style="text-decoration: none">
                            <el-dropdown-item style="font-size: 14px; padding: 5px 0">
                                博客管理
                            </el-dropdown-item>
                        </router-link>
                        <router-link to="/front"  style="text-decoration: none;">
                            <el-dropdown-item style="font-size: 14px; padding: 5px 0">
                                <span>返回首页</span>
                            </el-dropdown-item>
                        </router-link>
                    </el-dropdown-menu>
                </el-dropdown>
            </div> -->
        </div >
    </div>


    <div style="width: 100%;height: 100%;">
        <div style="height: 100%;width: 100%">
            <mavon-editor ref="md" style="height: 100%;width: 100%" v-model="article.content" :ishljs="true" :scrollStyle="true"  @imgAdd="imgAdd"/>
        </div>
    </div>

        <el-dialog title="文章信息" :visible.sync="dialogFormVisible" width="30%" fullscreen="true">
            <el-form label-width="80px"   ref="article" :model="article">

                <el-form-item label="文章类型" >
                    <el-select v-model="article.typeid" placeholder="请选择">
                        <el-option
                                v-for="item in  articleTypes"
                                :key="item.id"
                                :label="item.name"
                                :value="item.id">
                        </el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="文章概述" >
                    <el-input type="textarea" rows="5" maxlength="50" show-word-limit v-model="article.summary" autocomplete="off"></el-input>
                </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button style="width: 70px;height: 40px "  @click="dialogFormVisible = false">取 消</el-button>
                <el-button style="width: 70px;height: 40px "  type="primary"  @click="handleSave">确 定</el-button>
            </div>
        </el-dialog>
    </div>
</template>

<script>
    import axios from "axios";

    export default {
        name: "ArticleRelease",
        data(){
            return {
                textarea:"请输入标题",
                user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {username:""},
                article:{
                },
                dialogFormVisible:false,
                articleTypes:[],
            }
        },
        created() {
            this.loadArticleType()
        },
        methods:{
            handleSave(){
                const form = this.article
                form.userid = this.user.id
                this.request.post("/article",form).then(res =>{
                    console.log(res)
                    if(res){
                        this.$message.success("发布成功，请到个人中心查看！")
                        this.$router.push("/front/article")
                    }else{
                        this.$message.error("发布失败！")
                    }
                    this.dialogFormVisible = false,
                        this.form = {}
                    this.load()
                })
            },
            imgAdd(pos, $file) {
                let $vm = this.$refs.md
                // 第一步.将图片上传到服务器.
                const formData = new FormData();
                formData.append('file', $file);
                axios({
                    url: 'http://localhost:9090/file/upload',
                    method: 'post',
                    data: formData,
                    headers: {'Content-Type': 'multipart/form-data'},
                }).then((res) => {
                    // 第二步.将返回的url替换到文本原位置![...](./0) -> ![...](url)
                    $vm.$img2Url(pos, res.data);
                })
            },
            ArticleRelease(){
                this.article.userid = this.user.id
                this.request.post("/article",this.article).then(res =>{
                    console.log(res)
                    if(res){
                        this.$message.success("发布成功！请前往个人中心查看。")
                        this.$router.push("/front")
                    }else{
                        this.$message.error("发布失败！")
                    }

                })
            },
            handleEdit(){
                    this.dialogFormVisible = true//打开

            },
            loadArticleType(){
                this.request.get("/type").then(res=>{
                    this.articleTypes = res.data
                })
            },
        }
    }
</script>

<style scoped>
    *{
        margin: 0;
        padding: 0;
    }

    .PersonalCenter{
        float: left;
        width: 150px;
        height: 100%;
        margin-left: 70px;
        text-align: center;
        line-height: 60px;
        color: #3F5EFB;
        font-size: 16px;


    }
    a{
        text-decoration:none;
        color: #409EFF;
    }
    .title{
        float: left;
        height: 100%;
        width: 800px;
        text-align: center;
        line-height: 60px;
        margin-left: 50px;
        padding-left: 50px;

    }
    .title input{
        width: 100%;
        height: 40px;
        border-radius: 20px;
        border:0px;
        color: #ccc;
        padding:0px 20px;
        font-size: 20px;
        outline: none;
        overflow: auto;
        border: 1px solid  #409EFF ;
    }
    .title input:focus{
        outline: 1px solid #409EFF;
    }
    .release{
        float: left;
        width:300px;
        height: 60px;
        text-align: center;
        line-height: 60px;
        margin-left: 35px;
    }
    .touxiang{
        float: left;
        margin-left: 20px;
        height: 100%;
        width: 50px;
    }

</style>