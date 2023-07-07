<template>
    <div>
        <div style="padding: 5px 0;">
            <el-input style="width: 200px" placeholder="请输入文章名称" suffix-icon="el-icon-search" v-model="name"></el-input>
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

            <el-table-column prop="name" label="文章标题" width="100" align="center"></el-table-column>
            <el-table-column prop="summary" label="文章概述" width="100" align="center"></el-table-column>
            <el-table-column prop="content" label="文章内容" width="200" align="center">
                <template slot-scope="scope">
                    <el-button type="primary" @click="view(scope.row.content)">查看内容</el-button>
                </template>
            </el-table-column>
            <el-table-column prop="user" label="发布人" width="200" align="center"></el-table-column>
            <el-table-column prop="time" label="发布时间" width="200" align="center"></el-table-column>
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
        <el-dialog title="文章信息" :visible.sync="dialogFormVisible" width="100%" fullscreen="true">
            <el-form label-width="80px"   ref="form" :model="form">
                <el-form-item label="文章标题" >
                    <el-input v-model="form.name" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="文章概述" >
                    <el-input v-model="form.summary" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="文章类型" >
                    <el-select v-model="form.typeid" placeholder="请选择">
                        <el-option
                                v-for="item in  articleTypes"
                                :key="item.id"
                                :label="item.name"
                                :value="item.id">
                        </el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="文章内容" >
                        <mavon-editor ref="md" style="height: 100%" v-model="form.content" :ishljs="true" @imgAdd="imgAdd"/>
                </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="dialogFormVisible = false">取 消</el-button>
                <el-button type="primary"  @click="handleSave">确 定</el-button>
            </div>
        </el-dialog>


        <el-dialog title="文章预览" :visible.sync="viewDialogVis" width="60%" >
          <el-card>
              <div>
                  <mavon-editor
                          class="md"
                          :value="content"
                          :subfield="false"
                          :defaultOpen="'preview'"
                          :toolbarsFlag="false"
                          :editable="false"
                          :scrollStyle="true"
                          :ishljs="true"
                          index
                  />
              </div>
          </el-card>
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
        name: "Article",
        data(){
            return {
                articleTypes:[],
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
            this.loadArticleType()
        },
        methods:{
            createFilter(queryString) {
                return (articleType) => {
                    return  (articleType.name.toLowerCase().indexOf(queryString.toLowerCase()) === 0);
                };
            },

            querySearch(queryString, cb) {
                var articleTypes = this.articleTypes;
                var results = queryString ? articleTypes.filter(this.createFilter(queryString)) : articleTypes;
                // 调用 callback 返回建议列表的数据
                cb(results);
            },
            loadArticleType(){
                this.request.get("/type").then(res=>{
                    this.articleTypes = res.data
                })
            },
            view(content) {
                this.content = content
                this.viewDialogVis = true
            },
            // 绑定@imgAdd event
            imgAdd(pos, $file) {
                let $vm = this.$refs.md
                // 第一步.将图片上传到服务器.
                const formData = new FormData();
                formData.append('file', $file);
                axios({
                    url: 'http://localhost:9090/file/upload',
                    method: 'post',
                    data: formData,
                    headers: {'Content-Type': 'multipart/form-data'},
                }).then((res) => {
                    // 第二步.将返回的url替换到文本原位置![...](./0) -> ![...](url)
                    $vm.$img2Url(pos, res.data);
                })
            },
            handleSave(){
                const form = this.form
                form.userid = this.user.id
                this.request.post("/article",form).then(res =>{
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
                    // this.handleSave()
            },
            load(){
                this.request.get("/article/page",{
                    params: {
                        pageNum: this.pageNum,
                        pageSize:this.pageSize,
                        name:this.name,
                    }
                }).then(res=>
                {
                    console.log(res)
                    this.tableData = res.data.records
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
                this.request.delete("/article/"+id).then(res =>{
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
                this.request.post("/article/del/batch",ids).then(res=>{
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