<template>
    <div>
        <div style="padding: 5px 0;">
            <el-input style="width: 200px" placeholder="请输入类型名称" suffix-icon="el-icon-search" v-model="name"></el-input>
            <el-button  style="margin-left: 10px" type="primary" @click="load">搜索</el-button>
            <el-button  style="margin-left: 10px" type="warning" @click="reset">重置</el-button>
        </div>
        <div></div>
        <div style="display: block; margin-top:10px ;">
            <el-button type="primary" @click="handleAdd">新增<i class="el-icon-plus" style="margin-left: 2px"></i></el-button>
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
            <el-table-column prop="name" label="标签名称" width="100"  align="center"></el-table-column>
            <el-table-column prop="content" label="标签简介" width="500"  style="height: 100px;overflow: hidden" align="center"></el-table-column>
            <el-table-column prop="url" label="标签提供的图片地址" width="300"  align="center"></el-table-column>
            <el-table-column label="操作"  align="center">
                <template slot-scope="scope">
                    <el-button type="warning" @click="handleEdit(scope.row)">编辑<i class="el-icon-edit" ></i></el-button>
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
        <!-- 编辑的弹窗-->
        <el-dialog title="标签编辑" :visible.sync="dialogFormVisible" width="500px" style="height: 600px">
            <el-form label-width="80px"   ref="form" :model="form">
                <el-form-item label="标签名称" >
                    <el-input v-model="form.name" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="标签简介" >
                    <el-input type="textarea" rows="3" maxlength="100" show-word-limit v-model="form.content" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="标签所指向的图片" >
                    <el-input v-model="form.url" type="textarea" rows="3" maxlength="100" show-word-limit autocomplete="off"></el-input>
                </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="dialogFormVisible = false">取 消</el-button>
                <el-button type="primary"  @click="handleSave">确 定</el-button>
            </div>
        </el-dialog>


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
    import axios, {Axios as request} from "axios";

    export default {
        name: "CategoryControlerView",
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
                form:{
                    id:""
                },
                dialogFormVisible:false,
                viewDialogVis: false,
                state1: '',
                user:localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {},
            }
        },
        created() {
            this.load()
        },
        methods:{
            view(content) {
                this.content = content
                this.viewDialogVis = true
            },
            handleSave(){
                const form = this.form
                form.userid = this.user.id
                this.request.post("/type",form).then(res =>{
                    console.log(res)
                    if(res){
                        this.$message.success("保存成功！")
                    }else{
                        this.$message.error("保存失败！")
                    }
                    this.dialogFormVisible = false,
                        this.form = {}
                    this.load()
                })
            },
            handleAdd(){
                this.dialogFormVisible = true,
                    this.form = {}
            },
            load(){
                this.request.get("/type/page",{
                    params: {
                        pageNum: this.pageNum,
                        pageSize:this.pageSize,
                        name:this.name,
                    }
                }).then(res=>
                {
                    console.log(res)
                    this.tableData = res.records
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
            handleDelete(id){
                this.request.delete("/type/"+id).then(res =>{
                    if(res){
                        this.$message.success("删除成功！")
                    }else{
                        this.$message.error("删除失败！")
                    }
                    this.load()
                })
            },
            handleEdit(row){
                this.form = JSON.parse(JSON.stringify(row)),//赋予数据
                    this.dialogFormVisible = true//打开

            },
            reset(){
                this.name = null;
                this.type = null;
                this.load()
            },
            delBatch(){
                let ids = this.multipleSelection.map(v=> v.id)//讲一个对象数组变成一个纯id的数组
                this.request.post("/type/del/batch",ids).then(res=>{
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
                this.request.post("/article/update", row).then(res => {
                    if (res.code === '200') {
                        this.$message.success("操作成功!")
                    }
                })
            },
        }
    }
</script>

<style scoped>

</style>