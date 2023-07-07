<template>
    <div>
        <!--        文章信息展示-->
        <div class="newArticle">
            <div class="newArticleInfor" v-for="item in collectedArticleList">
                <!--            文章标题-->
                <div class="headOfNewArticle" style="flex: 1">
                    <div style="font-size: 18px;color: #222226;padding: 5px 20px" @click="$router.push('/front/articleDetail?id='+item.id)">
                        {{item.name}}
                    </div>
                </div>
                <!--            文章简介-->
                <div style="flex: 1;font-size: 14px;color: #555666;padding: 5px 25px">
                    {{item.summary}}
                </div>
                <!--            其他-->
                <div style="flex: 2;padding: 5px 20px;font-size: 14px;color: #555666">
                    <sapn>发布博客于</sapn> {{item.time}}
                </div>
            </div>

        </div>



    </div>
</template>

<script>
    export default {
        name: "PersonalCollectView",
        data(){
            return{
                collectedArticleList:[],
                id:this.$route.query.id,
                user:localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {},


            }
        },
        created() {
            this.loadArticleList()
        },
        methods:{
            loadArticleList(){
                this.request.get("/article/selectCollectionArticle/"+this.id).then(res=>{
                    this.collectedArticleList = res.data
                })
            },


        }
    }
</script>

<style scoped>
    .newArticle{

        width: 100%;

    }
    .newArticleInfor{
        display: flex;
        flex-direction: column;
        margin-top: 1px;
        background-color: #ffffff;
    }
    .headOfNewArticle{
        cursor: pointer;
    }
    .newArticleInfor:hover{
        background-color: #F5F6F7;
    }
</style>