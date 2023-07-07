<template>
    <div>
        <div style="padding: 5px 0;">
            <el-input style="width: 200px" placeholder="文件名称" suffix-icon="el-icon-search" v-model="name"></el-input>
            <el-input style="width: 200px; margin-left: 10px" placeholder="请输入文件类型" suffix-icon="el-icon-message" v-model="type"></el-input>
            <el-button  style="margin-left: 10px" type="primary" @click="load">搜索</el-button>
            <el-button  style="margin-left: 10px" type="warning" @click="reset">重置</el-button>
        </div>
        <div></div>
        <div style="display: block; margin-top:10px ;">
            <el-upload
                    action="http://localhost:9090/file/upload"
                    style="display: inline-block;margin-right: 4px"
                    :show-file-list="false"
                    :on-success="importSuccess"
            >
                <el-button type="primary">上传<i class="el-icon-download" ></i></el-button>
            </el-upload>
            <el-popconfirm
                    confirm-button-text='确定'
                    cancel-button-text='我再想想'
                    icon="el-icon-info"
                    icon-color="red"
                    title="您确定删除这些数据吗？"
                    @confirm="delBatch"
            >
                <el-button type="danger" slot="reference" style="margin-left: 10px">批量删除<i class="el-icon-close" style="margin-left: 2px"></i></el-button>
            </el-popconfirm>


        </div>
        <el-table :data="tableData" stripe  @selection-change="handleSelectionChange">>
            <el-table-column
                    type="selection"
                    width="55">
            </el-table-column>
            <el-table-column prop="id" label="ID" width="80" align="center"></el-table-column>
            <el-table-column prop="name" label="文件名称" width="140" align="center"></el-table-column>
            <el-table-column prop="type" label="文件类型" width="200" align="center"></el-table-column>
            <el-table-column prop="size" label="文件大小(kb)" width="200" align="center"></el-table-column>
            <el-table-column label="预览" align="center">
                <template slot-scope="scope">
                    <el-button type="primary" @click="preview(scope.row.url)">预览</el-button>
                </template>
            </el-table-column>
            <el-table-column label="下载" align="center">
                <template slot-scope="scope">
                    <el-button type="primary" @click="download(scope.row.url)">下载</el-button>
                </template>
            </el-table-column>
            <el-table-column label="启用" align="center">
                <template slot-scope="scope">

                        <el-switch
                                v-model="scope.row.enable"
                                active-color="#13ce66"
                                inactive-color="#ccc"
                                active-value="1"
                                @change="changeEnable(scope.row)"
                                inactive-value="0"

                        >
                        </el-switch>

<!--                    <el-switch v-model="scope.row.enable" active-color="#13ce66" inactive-color="#ccc"-->
<!--                               @change="changeEnable(scope.row)"></el-switch>-->
                </template>
            </el-table-column>
            <el-table-column label="操作"   align="center">

                <template slot-scope="scope">
                    <el-popconfirm
                            confirm-button-text='确定'
                            cancel-button-text='我再想想'
                            icon="el-icon-info"
                            icon-color="red"
                            title="您确定删除吗？"
                            @confirm="handleDelete(scope.row.id)"
                    >
                        <el-button type="danger"  style="margin-left: 10px" slot="reference">删除<i class="el-icon-close"></i></el-button>
                    </el-popconfirm>
                </template>
            </el-table-column>
        </el-table>

        <div style="padding: 10px 0">
            <el-pagination
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
    import {Axios as request} from "axios";
    export default {
        name: "File",
        data(){
            return {
               tableData: [],
                total:0,
                pageNum:1,
                pageSize:7,
                sideWidth:200,
                name:"",
                type:"",
                multipleSelection:[]
            }
        },
        created() {
            this.load()
        },
        methods:{
            load(){
                this.request.get( "/file/page",{
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
            handleDelete(id){
                this.request.delete("/file/"+id).then(res =>{
                    if(res){
                        this.$message.success("删除成功！")
                    }else{
                        this.$message.error("删除失败！")
                    }
                    this.load()
                })
            },
            reset(){
               this.name = null;
               this.type = null;
                    this.load()
            },
            delBatch(){
                let ids = this.multipleSelection.map(v=> v.id)//讲一个对象数组变成一个纯id的数组
                this.request.post("/file/del/batch",ids).then(res=>{
                    if(res){
                        this.$message.success("批量删除成功！")
                    }else{
                        this.$message.error("批量删除失败！")
                    }
                    this.load()

                })
            },
            handleSelectionChange(val){
                this.multipleSelection = val
            },
            importSuccess(){
                this.$message.success("资源上传成功！");
                this.load()
            },
            changeEnable(row) {
                this.request.post("/file/update", row).then(res => {
                    if (res.code === '200') {
                        this.$message.success("操作成功!")
                    }
                })
            },
            download(url) {
                window.open(url)
            },
            preview(url) {
                window.open('https://file.keking.cn/onlinePreview?url=' + encodeURIComponent(window.btoa((url))))
            },
        }
    }
</script>

<style scoped>

</style>