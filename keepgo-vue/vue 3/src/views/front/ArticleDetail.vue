<template>
<div class="all">
<!--    侧边栏-->
    <div class="AsideNav">
<!--    用户信息-->
        <div class="userInfor">
<!--            头像和用户名-->
            <div class="avaAndNickname">
                <div class="ava">
                    <el-image :src="author.avatarUrl" style="width: 70px; height: 70px; border-radius: 50%;flex: 1; " @click="$router.push('/front/personalCenter/newArticleOfPersonal?id='+author.id)" ></el-image>
                </div>
                <div class="nicknameOfUser">
                    <div style="font-size: 14px; flex: 1;display: flex;align-items: center;margin-left: 10px">
                        {{author.nickname}}
                    </div>
                    <div style="font-size:10px;color:#999AAA;  flex: 1;display: flex;flex-direction: column;justify-content: center; margin-left: 10px">
                        <i class="el-icon-message"> <span>邮箱:</span></i>
                        <div style="font-size: 10px">
                            {{author.email}}
                        </div>
                    </div>
                </div>
            </div>
<!--            用户的创作信息-->
            <div class="ArticleInforOfUser">
                <div style="flex: 1;display: flex;align-items: center;flex-direction: column;text-align: center">
                    <div style="flex: 1;">
                        <i  class="el-icon-view"></i>
                    </div>
                    <div style="flex: 1">总被浏览量</div>
                    <div style="flex: 1">{{readNumber}}</div>
                </div>
                <div style="flex: 1;display: flex;align-items: center;flex-direction: column;text-align: center">
                    <div style="flex: 1;">
                        <i  class="el-icon-tickets"></i>
                    </div>
                    <div style="flex: 1">被收藏数</div>
                    <div style="flex: 1">{{collectedNumber}}</div>
                </div>
            </div>
<!--            私信按钮-->

        </div>
<!--        搜多当前用户的文章-->


        <!--    用户的最新文章-->
        <div class="articleOfUser">
            <div style="flex: 2;display: flex;align-items: center;background-color: #409EFF">
             <div style="flex: 1;display: flex;justify-items: center;align-items: center;background-color: #409EFF">
                 <div style="flex: 10;text-align: left;color: #FFFFFF;font-size: 16px;margin-left: 10px">
                     他的文章
                 </div>
                 <div style="flex: 1;">
                    <img src="../../assets/zhifeiji.png">
                 </div>
             </div>
            </div>
            <div   style="flex: 16;">
                <div  class="theTitleOfArticle2" v-for="item in tableData" :key="item.id" style="margin-top: 2px;padding-top: 10px">
                    <div class="article-head" style=" cursor: pointer;margin:0px 5px ;line-height: 22px;height: 22px;text-overflow: ellipsis;
overflow: hidden;color: #000; font-weight: normal"   @click="pushPage(item.id)">{{item.name}}</div>
                    <div style="height: 40px;overflow: hidden ;text-overflow:ellipsis;color: #999999;word-break: break-all;font-size: 14px;padding-left: 5px">
                        {{item.summary}}
                    </div>
                </div>
            </div>
        </div>
    </div>
<!--    文章主体及其评论信息-->
    <div class="articleDetail" >
<!--        文章标题-->
        <div class="headOfArticle">
            <div class="head">
            <div style="flex: 8">
                <h1>{{ article.name }}</h1>
            </div>
                <div style="flex: 1">
                    <el-button   v-if="!showSign"  type="primary" round @click="collectArticle">收藏文章</el-button>
                    <el-button  v-if="showSign"  type="primary" round @click="deleteCollection">取消收藏</el-button>
                </div>
            </div>
<!--            文章所属专题或者标签-->
            <div class="tip">
                <div class="timeAndUser" style="flex: 1">
                    <i class="el-icon-user-solid"></i> <span>{{ article.user }}</span>

                     <span>  于  <i class="el-icon-time" ></i>{{ article.time }} 发布</span>
                </div>

                <div class="classification" style="flex: 1;display: flex">
                    文章标签:<span style="align-items: center;flex: 1;margin-left: 10px;"><i style="background-color: rgba(64,158,255,0.2);padding: 0 10px;border-radius: 5px">{{article.type}}</i></span>
                </div>
            </div>
        </div>
<!--        文章主体内容-->
        <div class="bodyOfArticle">
            <mavon-editor
                    style="background: #FFFFFF"
                    class="md"
                    :value="article.content"
                    :subfield="false"
                    :boxShadow="false"
                    :defaultOpen="'preview'"
                    :toolbarsFlag="false"
                    :editable="false"
                    :scrollStyle="true"
                    :ishljs="true"
            />
        </div>
<!--        文章评论信息-->
        <div class="replyOfArticle">
            <h2>评论</h2>
<!--            自己发表评论-->
            <div class="releaseComment">
                <el-image :src="user.avatarUrl" style="width: 70px; height: 70px; border-radius: 50%;margin-top: 30px;flex: 1"></el-image>
              <div style="flex: 12;display: flex;gap: 5px;padding-bottom: 50px;">
                  <el-input
                          v-model="commentForm.content"
                          type="textarea"
                          rows="3"
                          placeholder="一定要说正确的话哦，争议评论将被删除"
                          style="margin-top: 30px;flex: 20;font-size: 16px; "
                  >
                  </el-input>
                  <el-button round type="primary" style="flex: 1;margin-top:30px" @click="save">
                      <div style="display: flex;flex-direction: column;justify-content: center;align-items: center;width:50px;height: 50px">
                          <div style="flex: 1;display: flex;height: 25px;width: 50px;justify-content: center;align-items: center">
                              <div style="flex: 1;">
                                  发
                              </div>
                              <div style="flex: 1;">
                                  表
                              </div>
                          </div>
                          <div style="flex: 1;display: flex;height: 25px;width: 50px;justify-content: center;align-items: center">
                              <div style="flex: 1;">
                                  评
                              </div>
                              <div style="flex: 1;">
                                  论
                              </div>
                          </div>
                      </div>
                  </el-button>
              </div>
            </div>
<!--            评论列表-->
            <div v-for="item in comments" :key="item.id" class="replyItemList">
                <el-image :src="item.avatarUrl" style="width: 70px; height: 70px; border-radius: 50%;margin-top: 30px;flex: 1"></el-image>
                <div class="replyItemListContent">
<!--                    评论人的用户名-->
                    <div style="flex: 1;font-size: 12px;color: #6D757A">
                        {{ item.nickname }}:
                    </div>
<!--                    评论内容-->
                    <div style="flex: 3;color: #222222; padding: 10px 0px;font-size: 14px;">
                        <div style="overflow:hidden;text-overflow: ellipsis;height: auto;word-break: break-all;">{{ item.content }}</div>
                    </div>
<!--                   时间和其他 -->
                    <div style="flex: 1;font-size: 12px;color: #99A2AA;display: flex">
                       <span style="margin-left: 10px;flex: 1">{{ item.time }}</span>
<!--                        回复和删除-->
                        <div style="flex: 5">
                            <el-link type="primary"  @click="handleReply(item.id)">回复</el-link>
                            <el-link type="danger" @click="del(item.id)" v-if="user.id === item.userId" style="margin-left: 20px">删除</el-link>
                        </div>
                    </div>
                    <div class="childrenRpelyList" v-if="item.children.length">
                        <!--                   子集评论列表-->
                        <div class="childrenOfReply" v-for="subItem in item.children" :key="subItem.id" style="flex: 1">
<!--                            子评论的用户头像-->

                            <div style="flex: 1;display: flex">
                                <el-image :src="subItem.avatarUrl" style="width: 30px; height: 30px; border-radius: 50%;flex: 1"></el-image>
                            </div>

<!--                            子评论的具体信息-->
                            <div style="flex: 28;display: flex;flex-direction: column">
                                <div style="display: flex;">
                                    <span style="flex: 1;font-size: 12px;text-align: center;margin-top: 5px;color: #6D757A">{{subItem.nickname}}</span>
                                    <!--                                    被回复人的名称-->
                                    <div style="flex: 2;font-size: 12px;color: #409EFF;padding: 5px 10px" v-if="subItem.pnickname">
                                        <span style="margin-right: 5px; color: #6D757A">回复</span> @{{ subItem.nickname }}:
                                    </div>
                                    <!--                                回复的信息和回复人的用户名-->
                                    <div style="display: flex;flex: 18">
                                        <span style="font-size: 12px;margin-top: 5px">{{subItem.content}}</span>
                                    </div>

                                </div>
                                <!--                                    回复和删除按钮-->
                                <div style="flex: 1;display: flex;align-items: center;justify-items: center;margin-top: 10px">
                                       <span style="margin-left: 10px;flex: 1;font-size: 12px;color: #6D757A">{{ subItem.time }}</span>
                                        <div style="flex: 5;display: flex;padding-left: 5px">
                                            <el-link type="primary"  style="font-size: 12px" @click="handleReply(subItem.id)">回复</el-link>
                                            <el-link type="danger" @click="del(subItem.id)" v-if="user.id === subItem.userId" style="font-size: 12px;margin-left: 20px">删除</el-link>
                                        </div>
                                </div>
                            </div>

                        </div>

                    </div>



                </div>
<!--子集评论菜单-->

            </div>

            </div>

        <el-dialog title="回复" :visible.sync="dialogFormVisible" width="50%" >
            <el-form label-width="80px" size="small">
                <el-form-item label="回复内容">
                    <el-input type="textarea" v-model="commentForm.contentReply" autocomplete="off"></el-input>
                </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="dialogFormVisible = false" size="small">取 消</el-button>
                <el-button type="primary" @click="save"  size="small">确 定</el-button>
            </div>
        </el-dialog>
    </div>


</div>
</template>

<script>

    export default {
        name: "ArticleDetail",
        data() {
            return {
                author:localStorage.getItem("author") ? JSON.parse(localStorage.getItem("author")) : {},
                nextauthor:{},
                article: {},
                user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {},
                comments: [],
                commentForm: {},
                id: this.$route.query.id,
                dialogFormVisible: false,
                tableData:[],
                collectInformation:{},
                collectInformationArticlid:[],
                showSign:false,
                readNumber:0,
                collectedNumber:0,
            }
        },
        created() {
            this.load()
            this.loadComment()
            this.loadDataOfAuthor()
            this.rec_article()
            this.loadCollectInArticleId()

        },
        mounted(){
            this.loadReadNumber()
            this.loadCollectedNumber()
        },
        watch: { $route (to, from) { this.$router.go(0) } ,

        },
        methods: {
            loadCollectedNumber(){
                this.request.get("/user//findCollectionNumber/"+this.author.id).then(res=>{
                    this.collectedNumber = res.data
                })
            },
            load() {
                this.request.get("/article/" + this.id).then(res => {
                    this.article = res.data
                })
            },
            loadComment() {
                this.request.get("/comment/tree/" + this.id).then(res => {
                    this.comments = res.data
                })
            },
            loadDataOfAuthor(){
              this.request.get("/user/findUserInfor/"+this.id).then(res =>{
                  this.author = res.data
                  localStorage.removeItem("author")
                  localStorage.setItem("author",JSON.stringify(res.data))
              })
            },
            save() {
                if (!this.user.id) {
                    this.$message.warning("请登录后操作")
                    return
                }
                this.commentForm.articleId = this.id
                if (this.commentForm.contentReply) {
                    this.commentForm.content = this.commentForm.contentReply
                }
                this.request.post("/comment", this.commentForm).then(res => {
                    if (res.code === '200') {
                        this.$message.success("评论成功")
                        this.commentForm = {}  // 初始化评论对象内容
                        this.loadComment()
                        this.dialogFormVisible = false
                    } else {
                        this.$message.error(res.msg)
                    }
                })
            },
            del(id) {
                this.request.delete("/comment/" + id).then(res => {
                    if (res.code === '200') {
                        this.$message.success("删除成功")
                        this.loadComment()
                    } else {
                        this.$message.error("删除失败")
                    }
                })
            },
            pushPage(id){
                this.$router.push('/front/articleDetail?id='+id)

            },
            handleReply(pid) {
                this.commentForm = { pid: pid }
                this.dialogFormVisible = true
            },
            rec_article(){
                this.request.get("/user/findUserInfor/"+this.id).then(res =>{
                   this.nextauthor = res.data
                    this.request.get("/article/pageOfUsersArticle",{
                        params: {
                            id:this.nextauthor.id
                        }
                    }).then(res=>
                    {
                        this.tableData = res.data
                    })//将数据转化为json
                })


            },
            loadReadNumber()
            {
                this.request.get("/user/findReadNumber/"+this.author.id).then(res=>{
                    this.readNumber =  res.data
                })
            },
            collectArticle(){
                this.collectInformation.userid = this.user.id
                this.collectInformation.articleid = this.id
                this.collectInformation.authorid = this.author.id
                this.request.post("/collection",this.collectInformation).then(res=>{
                    if(res.code=="200"){
                        this.$message.success("收藏成功！")
                        this.collectInformation={}
                        this.load()
                        this.loadComment()
                        this.loadDataOfAuthor()
                        this.rec_article()
                        this.loadCollectInArticleId()
                    }
                })

            },
            //加载关于用户的收藏信息
            // loadCollectInformation(){
            //     this.request.get("/collection/"+this.user.id).then(res=>{
            //         this.collectInformation=res.data
            //         this.collectInformationArticlid=res.data.articleid
            //     })
            // },
            loadCollectInArticleId(){
                this.request.get("/collection/aticleId/"+this.user.id).then(res=>{
                    this.collectInformationArticlid=res.data
                    console.log(res.data)
                    for(let index = 0; index < this.collectInformationArticlid.length; index++){
                        console.log(this.collectInformationArticlid[index])
                        console.log(this.id+"")
                        if(this.collectInformationArticlid[index]==this.id){
                            this.showSign=true
                            return true
                        }
                    }
                })
            },
            deleteCollection(){
                //传入文章id和用户id来删除
                this.request.delete("/collection/del/"+this.id+"/"+this.user.id).then(res=>{
                    if(res.code=="200"){
                        this.$message.success("取消收藏成功！")
                        this.showSign = !this.showSign
                    }
                })
            }
        }
    }
</script>

<style scoped>
    .all{
        display: flex;
        justify-content: center;
        gap: 10px;
    }
.AsideNav{

    position: sticky;
    top: 50px;
    margin-left: 10px;
    padding-top: 5px;
    display: flex;
    gap: 5px;
    flex-direction:column;
    float: left;
    width: 230px;
    height:600px;
    background-color:#FFFFFF;
    border-radius: 5px;
}
    .articleDetail{

        gap: 10px;
        flex-direction: column;
        display: flex;
        float: left;
        width: 1024px;
        height: auto;
    }
    .userInfor{
        padding-left: 10px;
     flex-direction: column;
    display: flex;
    width: 200px;
    height: 200px;
}
    .userArticleSearch{
        align-items:center;
        display: flex;
        justify-content: center;
        width: 230px;
        height: 50px;

    }
    .articleOfUser{
        display: flex;
        flex-direction: column;
        width: 230px;
        height: 400px;
    }
    .headOfArticle{
        background-color: #FFFFFF;
        padding: 0px 30px;
        flex-direction:column;;
        display: flex;
        width: 1024px;
        height: 150px;

    }
    .bodyOfArticle{
        z-index: 2;
        border: none !important;
        width: 1024px;

    }
    .avaAndNickname{
        border-top: 1px solid #F8F8F8;
        width: 200px;
        display: flex;
        flex: 2;
    }
    .ArticleInforOfUser{
        flex: 2;
        width: 230px;
        display: flex;
    }
    .chat{
        flex: 1;
        width: 230px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .ava{
        cursor: pointer;
        display: flex;
        justify-items: center;
        justify-content: center;
        align-items: center;
        flex: 1;
    }
    .nicknameOfUser{
        display: flex;
        flex-direction: column;
        flex: 2;
    }
    .head{
        flex: 1;
        padding: 10px 0px;
        display: flex;

    }
    .tip{
        gap: 5px;
        font-size: 14px;
        color: #999AAA;
        flex-direction: column;
        display: flex;
        flex: 1;
        padding: 10px 10px;
        background-color:#F8F8F8;
    }
    .replyOfArticle{
        padding: 0px 30px;
        display: flex;
        flex-direction: column;
        height: auto;
        background-color: #FFFFFF;
    }
    .releaseComment{

        justify-content: center;
        gap: 20px;
        display: flex;
    }
    .replyItemList{
        border-top: 1px solid #409EFF;
       margin: 10px;
        justify-content: center;
        display: flex;
        gap: 20px;

    }
    .replyItemListContent{
        margin-bottom: 10px;
        margin-top: 30px;
        display: flex;
        flex-direction: column;
        flex: 12;
    }
    .childrenRpelyList{
        flex-direction: column;
        margin-top: 20px;
        display: flex;
    }
    .childrenOfReply{
        display: flex;
        margin: 5px 0;
    }
    .theTitleOfArticle2:hover{
        background-color: #F5F6F7;
    }


</style>