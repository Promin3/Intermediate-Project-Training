<template>
    <div style="width: 100%;height:450px;background-color: #FAFAFA">
      <div style="display: flex;flex-direction: column;justify-items: center;width: 100%;height: 100%">
          <div class="aaaa" v-for="item in recommandArticle" style="display: flex;flex: 1; flex-direction: column;padding: 10px 30px ;cursor: pointer" >
<!--            文章标题-->
              <div style="flex: 1;color: #222226;font-size: 18px;font-weight: 600; " @click="$router.push('/front/articleDetail?id='+item.id)">
                  <span>
                      {{item.name}}
                  </span>
              </div>
<!--              文章简介-->
              <div style="flex: 3;color: #999aaa;font-size: 16px;margin-top: 10px">
                        <span>{{item.summary}}</span>
              </div>

<!--              文章浏览量以及其他信息-->
              <div style="flex: 1;display: flex;align-items: center;color: #999aaa;font-size: 13px">
                        <span style="display: block;flex: 5">
                            <i class="el-icon-view"></i> {{item.readnumber}}
                        </span>
                  <div style="flex: 2">
                      <span style="margin-right: 10px"> <i class="el-icon-user"></i> {{item.user}}</span>
                      <sapn > <i class="el-icon-timer"></i> {{item.time}}</sapn>
                  </div>
              </div>
          </div>
      </div>
    </diV>
</template>

<script>
    export default {
        name: "recomandArticleOfHomeView",
        data(){
            return{
                recommandArticle:[],

            }
        },
        created() {
            this.loadRecommandArticleInfor()
            },
        methods:{
            loadRecommandArticleInfor(){
                this.request.get("/article/recommandArticle").then(res=>{
                    this.recommandArticle = res.data
                })
            },
        }
    }
</script>

<style scoped>
.aaaa:hover{
    background-color: rgb(240,240,240);
}
</style>