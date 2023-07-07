<template>
    <div style="margin: auto 50px;height: 1000px; z-index: 2; background-color: #FAFAFA">

        <div style="width: 70%;height: 100%;float: left; background-color:#FAFAFA">

            <div style="height: 45%;width: 100%;background-color:#FAFAFA;margin-top: 10px">

                <div class="newRecommend" style="width: 40%;height: 100%;float: left;background-color: #FAFAFA">
                    <div class="recommend" style="height: 30px; margin-top: 10px;width: 100%;background-color: #FAFAFA">
                       <div class="putImg">
                        <img src="../../assets/recomand.png">
                       </div>
                        <span>
                            推荐
                        </span>
                    </div>
                    <div style="margin-top: 10px;height: 100%;">
                        <template>
                            <div >
                                <el-carousel :interval="5000" arrow="always"   >
                                    <el-carousel-item  v-for="item in carousels"  :key="item.id" >
                                        <img :src="item.url"  style="clip: rect(0px,800px,800px,0px);width: auto;height: auto;min-height: 100%;min-width: 100%; background-repeat: no-repeat;background-position: center;position: absolute;z-index: 2;background-size:cover;">
                                        <span  style="margin-top: 100px;z-index: 99">
                                    {{item.content}}
                                        </span>
                                    </el-carousel-item>

                                </el-carousel>

                            </div>

                        </template>


                    </div>
                </div>

                <div class="newArticle" style="width: 38%;height: 100%;float: left;background-color:#FAFAFA;margin-left: 19.8px">
                        <div class="title_1" style="height: 30px;width: 100%;margin-top: 10px;background-color: #FAFAFA">
                                <div class="img_article">

                                </div>
                            <span>
                                最新文章
                            </span>
                            </div>
                    <div class="article_1" style="margin-top: 5px;height: 400px;width: 100%;">

                            <div  class="theTitleOfArticle" v-for="item in tableData" :key="item.id">
                                <div class="article-head" style=" cursor: pointer;margin:0px 5px ;line-height: 22px;height: 22px;text-overflow: ellipsis;
overflow: hidden;color: #000; font-weight: normal"   @click="$router.push('/front/articleDetail?id='+item.id)">{{item.name}}</div>
                                    <div style="height: 60px;overflow: hidden ;text-overflow:ellipsis;color: #999999;word-break: break-all;font-size: 14px;padding-left: 5px">
                                        {{item.summary}}
                                    </div>
                            </div>


                    </div>
                </div>



            </div>


            <div style="height: 51%;width: 100%;background-color: rgb(245,246,247);margin-top: 10px;margin-bottom: 30px">
              <div>
                  <el-menu
                          :default-active="'/front/home/recomandArticleOfHomeView'"
                           class="el-menu-demo"
                           mode="horizontal"
                           router
                           @select="handleSelect"
                           >
                      <el-menu-item index="/front/home/recomandArticleOfHomeView">推荐文章</el-menu-item>
                      
                  </el-menu>
              </div>

                    <router-view></router-view>
            </div>


        </div>

        <div style="width: 29%;height: 100%;float:right;background-color: #FAFAFA;margin-bottom: 10px">

           
            <a  class="guanggao" href="https://www.bilibili.com/video/BV1Vg4y1A7qY/?spm_id_from=333.1007.top_right_bar_window_history.content.click&vd_source=77709d5600919e481daf12902915bd01" target="_blank">

            </a>
        </div>


    </div>
</template>
<script>
    export default {
        name: "Home",
        props:{

        },
        data(){
            return{
                value: new Date(),
                carousels:[],
                c_span:{},
                tableData:[],
                resourcesTableData:[],
                recommandresourcesTableData:[]
            }
        },
        created() {
            this.load(),
            this.rec_article()
            this.loadNewResourcesInHome()
        },
        methods: {
            loadNewResourcesInHome(){
                this.request.get("/resources/newResourcsfHome").then(res=>{
                    this.resourcesTableData= res.data
                })
            },
            load() {
                this.request.get("/carousel").then(res => {
                    console.log(res)
                    this.carousels = res
                    console.log(this.carousels)
                })
            },
            download(url,id) {
                window.open(url)
                this.request.get("/resources/upadata/"+id);
            },

            rec_article(){
                this.request.get("/article/page",{
                    params: {
                        pageNum: 1,
                        pageSize:7,
                        name:this.name,
                    }
                }).then(res=>
                {
                    console.log(res)
                    this.tableData = res.data.records
                    this.total = res.data.total
                })//将数据转化为json

            },
        },


    }
</script>

<style scoped>
.recommend{
    height: 30px;
    line-height: 30px;
    padding-left: 30px;

}
    .putImg{
        height: 20px;
        width: 20px;
        float: left;
        margin-top: 5px;
    }
    .putImg img {
   width: 20px;
    height: 20px;
    }
    .recommend span{
        display: block;;
        float: left;
        margin-left: 10px;
        line-height: 30px;
        font-size: 18px;
        font-weight: bold;
    }
    .img_article {
        margin-top: 5px;
        margin-right: 10px;
        float: right;
        width: 20px;
        height: 20px;
        background-image: url("../../assets/article.png");
        background-size: 100%;
    }
    .newArticle span{
        float: right;
        display: block;
        height: 30px;
        line-height: 30px;
        margin-right: 20px;
        font-size: 18px;
        font-weight: bold;
    }
.img_resource{
    margin-top: 5px;
    margin-right: 10px;
    float: right;
    width: 20px;
    height: 20px;
    background-image: url("../../assets/resource.png");
    background-size: 100%;
}
.newASource span{
    float: right;
    display: block;
    height: 30px;
    line-height: 30px;
    margin-right: 20px;
    font-size: 18px;
    font-weight: bold;
}
.theTitleOfArticle{
    font-size: 16px;
    padding: 9px 10px;
    text-overflow: ellipsis;
    height: 56px;
    width: 200%;
    color: #222226;
    overflow: hidden;
}
.theTitleOfArticle:hover{
    background-color: #F5F6F7;
}
.theTitleOfResource:hover{
    background-color: #F5F6F7;
}
    .theTitleOfResource{
        margin-top: 8px;
        height: 50px;
        width: 100%;
        cursor: pointer;
    }
.guanggao{
    display: block;
    margin-top: 60px;
    width: 100%;
    height:45%;
    background-image: url("../../assets/guanggaoOfHome.jpg");
    background-size: 100%;

}
    .rili{
        margin-top: 10px;
        width: 100%;
        height: 400px;
    }

.rili /deep/  .el-calendar-table .el-calendar-day{
      height: 50px;
  }
    .carousel_content{
        display: block;
        height: 100px;
        padding-top: 30px;
        padding-left: 40px;
        padding-right: 40px;
        font-size: 18px;
        color: black;
        font-weight: bold;
    }
</style>
