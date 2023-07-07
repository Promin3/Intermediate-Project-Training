<template>
    <div style="background-color: #ffffff">
<!--        文章信息展示-->
        <div class="newArticle">
        <div class="newArticleInfor" v-for="item in ArticleTableData">
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


        <div style="padding: 10px 0">
            <el-pagination
                    style="background-color: #ffffff"
                    @size-change="handleSizeChange"
                    @current-change="handleCurrentChange"
                    :current-page="pageNum"
                    :page-sizes="[7,10]"
                    :page-size="pageSize"
                    layout="total, sizes, prev, pager, next, jumper"
                    :total="total">
            </el-pagination>
        </div>
    </div>
</template>

<script>
    import axios, {Axios as request} from "axios";

    export default {
        name: "NewArticle",
        data(){
            return{
                total:0,
                ArticleTableData:[],
                id:this.$route.query.id,
                user:localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {},
                pageNum:1,
                pageSize:7,
            }
        },
        created() {
            this.load()
            this.loadPersonalInfor()
        },
        watch: { $route (to, from) { this.$router.go(0) } },
        methods:{
            load(){
                this.request.get("/article/personalPage",{
                    params: {
                        pageNum: this.pageNum,
                        pageSize:this.pageSize,
                        id:this.id
                    }
                }).then(res=>
                {
                    console.log(res)
                    this.ArticleTableData = res.data.records
                    this.total = res.data.total
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