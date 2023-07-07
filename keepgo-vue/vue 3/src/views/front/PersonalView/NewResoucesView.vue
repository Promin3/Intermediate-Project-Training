<template>
    <div style="background-color: #ffffff">
            <div class="newResources">
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
    export default {
        name: "NewResoucesView",
        data(){
            return{
                user:localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {},
                tableData: [],
                total:0,
                pageNum:1,
                pageSize:7,
                sideWidth:200,
                name:"",
                type:"",
                multipleSelection:[],
                id:this.$route.query.id,
            }
        },
        created() {
            this.load()
        },
        methods:{
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
            load(){
                this.request.get( "/resources/ResourcesOfUserPage",{
                    params: {
                        pageNum: this.pageNum,
                        pageSize:this.pageSize,
                        name:this.name,
                        type:this.type,
                        userid:this.id
                    }
                }).then(res=>
                {
                    console.log(res)
                    this.tableData = res.records
                    this.total = res.total
                })
                //将数据转化为json
            },
        }
    }
</script>

<style scoped>
.newResources{
    width: 100%;
    display: flex;
    flex-direction: column;
}
.recommandResources{
    display: flex;
    flex: 1;
}
.recommandResources:hover{
    background-color: rgb(240,240,240);
}
</style>