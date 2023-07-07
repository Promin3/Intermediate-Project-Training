<template>
    <el-card class="box-card" style="width: 400px;margin: auto auto">
        <div slot="header" class="clearfix">
            <span style="font-size: 16px">个人信息</span>
            <el-button style="float: right; padding: 3px 0;font-size: 16px" type="text"  @click="handleSave">保存信息</el-button>
        </div>
        <div >
            <!-- <el-upload
                    style="text-align: center"
                    class="avatar-uploader"
                    action="http://localhost:9090/file/upload"
                    :show-file-list="false"
                    :on-success="handleAvatarSuccess"
                    >
                <img v-if="form.avatarUrl" :src="form.avatarUrl" class="avatar">
                <i v-else class="el-icon-plus avatar-uploader-icon"></i>
            </el-upload> -->

            <el-form label-width="80px"   ref="form" :model="form">
            <el-form-item label="昵称" >
                <el-input v-model="form.nickname" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="邮箱" >
                <el-input v-model="form.email" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="电话" >
                <el-input v-model="form.phone" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="地址" >
                <el-input v-model="form.address" autocomplete="off"></el-input>
            </el-form-item>
        </el-form>

        </div>
    </el-card>

</template>

<script>
    import {Axios as request} from "axios";
    import {setRoutes} from "../router";
    export default {

        name: "Person",
        data() {
            return{
                form:{},
                user: localStorage.getItem("user")?JSON.parse(localStorage.getItem("user")):{},
            }
        },
        methods: {
            handleSave() {
                this.request.post("/user", this.form).then(res => {
                    if (res) {
                        this.$message.success("保存成功！")

                        this.$emit("refreshUser")
                    } else {
                        this.$message.error("保存失败！")
                    }
                })
            },
            handleAvatarSuccess(res){
                this.form.avatarUrl = res
                console.log(res)
            }
        },
        created(){
            this.request.get("/user/username/"+this.user.username).then(res=>{
                if(res.code=200){
                    this.form = res.data
                }else if (res.code=400){
                    this.$message.error(res.msg);
                }
            })
        },

    }

</script>

<style >
    .avatar-uploader{
        margin-bottom: 10px;
    }
    .avatar-uploader .el-upload {
        border: 1px dashed #d9d9d9;
        border-radius: 6px;
        cursor: pointer;
        position: relative;
        overflow: hidden;
    }
    .avatar-uploader .el-upload:hover {
        border-color: #409EFF;
    }
    .avatar-uploader-icon {
        font-size: 28px;
        color: #8c939d;
        width: 178px;
        height: 178px;
        line-height: 178px;
        text-align: center;
    }
    .avatar {
        width: 118px;
        height: 118px;
        display: block;
    }
</style>