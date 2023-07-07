<template>
    <div>
        <div style="padding: 5px 0;text-align:left">
            <el-button  style="margin-left: 10px" type="primary" @click="load">搜索</el-button>
            <el-button  style="margin-left: 10px" type="warning" @click="reset">重置</el-button>
        </div>
        <div></div>
        <div style="display: block; margin-top:10px ;text-align:left">
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
            <el-table-column prop="logId" label="日志" width="80"></el-table-column>
            <el-table-column prop="uid" label="用户ID" width="80"></el-table-column>
            <el-table-column prop="ip" label="IP地址" width="140"></el-table-column>
            <el-table-column prop="os" label="操作系统" width="100"></el-table-column>
            <el-table-column  prop="browser" label="浏览器类型" width="100"></el-table-column>
            <el-table-column prop="loginTime" label="登录时间"></el-table-column>
            <el-table-column>
                <template slot-scope="scope">
                    <el-button type="warning" @click="handleEdit(scope.row)">编辑<i class="el-icon-edit" ></i></el-button>
                    <el-popconfirm
                            confirm-button-text='确定'
                            cancel-button-text='我再想想'
                            icon="el-icon-info"
                            icon-color="red"
                            title="您确定删除吗？"
                            @confirm="handleDelete(scope.row.logId)"
                    >
                        <el-button type="danger"  style="margin-left: 10px" slot="reference">删除<i class="el-icon-close"></i></el-button>
                    </el-popconfirm>
                </template>
            </el-table-column>
        </el-table>

        <div style="padding: 10px 0;text-align:left">
            <el-pagination
                    @size-change="handleSizeChange"
                    @current-change="handleCurrentChange"
                    :current-page="pageNum"
                    :page-sizes="[5,10]"
                    :page-size="pageSize"
                    layout="total, sizes, prev, pager, next, jumper"
                    :total="total">
            </el-pagination>
        </div>

        <!--      //弹窗-->
        <el-dialog title="用户信息" :visible.sync="dialogFormVisible" width="30%">
            <el-form label-width="80px"   ref="form" :model="form">
            <el-form-item label="IP地址" >
                <el-input v-model="form.ip" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="操作系统" >
                <el-input v-model="form.os" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="浏览器类型" >
                <el-input v-model="form.browser" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="登陆时间" >
                <el-input v-model="form.loginTime" autocomplete="off"></el-input>
            </el-form-item>
        </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="dialogFormVisible = false">取 消</el-button>
                <el-button type="primary"  @click="handleSave">确 定</el-button>
            </div>
        </el-dialog>
    </div>
</template>

<script>
import {Axios as request} from "axios";
    export default {
        name: "LoginLog",
        data() {
            return{
                tableData: [],
                total:0,
                pageNum:1,
                pageSize:5,
                sideWidth:200,
                dialogFormVisible:false,
                form:{},
                multipleSelection:[]
            }
        },
        created() {
            this.load()
        },
        methods:{
            load(){
                this.request.get( "http://localhost:9090/Loginlog/page",{
                    params: {
                        pageNum: this.pageNum,
                        pageSize:this.pageSize,
                        //  替换拼接字符串的方式
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
            handleDelete(logId){
                this.request.delete("http://localhost:9090/Loginlog/"+logId).then(res =>{
                    if(res){
                        this.$message.success("删除成功！")
                    }else{
                        this.$message.error("删除失败！")
                    }
                    this.load()
                })
            },
            handleAdd(){
                this.dialogFormVisible = true,
                    this.form = {},
                    this.handleSave()

            },
            handleEdit(row){
                this.form = JSON.parse(JSON.stringify(row)),//赋予数据
                    this.dialogFormVisible = true//打开

            },
            handleSave(){
                this.request.post("http://localhost:9090/Loginlog/",this.form).then(res =>{
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
            reset(){
                this.username = null,
                    this.email=null,
                    this.address=null,
                    this.form.email=null,
                    this.load()
            },
            delBatch(){
                let ids = this.multipleSelection.map(v=> v.id)//讲一个对象数组变成一个纯id的数组
                this.request.post("http://localhost:9090/user/del/batch",ids).then(res=>{
                    if(res){
                        this.$message.success("批量删除成功！")
                    }else{
                        this.$message.error("批量删除失败！")
                    }
                    this.load()

                })
            },
            handleSelectionChange(val){
                console.log(val)
                this.multipleSelection = val
            },
        }
    }
</script>

<style scoped>

</style>