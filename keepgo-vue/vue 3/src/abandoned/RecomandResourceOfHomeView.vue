<template>
    <div style="width: 100%;height:450px;background-color: #FAFAFA;display: flex;flex-direction: column">
        <div class="recommandResources" v-for="item in recommandresourcesTableData">
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
</template>

<script>
    export default {
        name: "RecomandResourceOfHomeView",
        data(){
            return {
                recommandresourcesTableData:[]
            }
        },
        created() {
            this.loadRecommandResources()
        },
        methods:{
            loadRecommandResources()
            {
                this.request.get("/resources/getRecommandResouces").then(res=>{
                    this.recommandresourcesTableData = res.data
                })
            },
            download(url,id) {
                window.open(url)
                this.request.get("/resources/upadata/"+id);
            },
        },

    }
</script>

<style scoped>
.recommandResources{
    display: flex;
    flex: 1;
}
    .recommandResources:hover{
        background-color: rgb(240,240,240);
    }
</style>