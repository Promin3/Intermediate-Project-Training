<template>
    <div style="margin: auto 350px;z-index: 2;">
        <el-card class="box-card" >
            <div slot="header" class="clearfix">
                <span>上传资源</span>
                </div>
            <div >

                    <el-form ref="form" :model="form" label-width="80px">
                        <el-form-item>
                            <el-upload
                                    class="upload-demo"
                                    ref="upload"
                                    :data={filename:this.form.filename,brief:this.form.briefResource,userid:this.user.id}
                                    drag
                                    action="http://localhost:9090/resources/upload"
                                    :auto-upload="false"
                                    :on-preview="handlePreview"
                                    multiple>
                                <i class="el-icon-upload"></i>
                                <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
                                <div class="el-upload__tip" slot="tip">可以上传多种类型文件，且文件不宜过大哦。</div>
                            </el-upload>
                        </el-form-item>
                        <el-form-item label="资源名称">
                            <el-input
                                    type="textarea"
                                    v-model="form.filename"
                                    :rows="3"
                                    placeholder="推荐格式:知识领域+技术关键词+内容关键词+用途"

                            ></el-input>
                        </el-form-item>

                        <el-form-item label="资源描述">
                            <el-input
                                    type="textarea"
                                    v-model="form.briefResource"
                                    :rows="10"
                                    placeholder="容我多说几句，让更多的人看到我的资源!
推荐格式:内容概要+适用人群+使用场景及目标+其他说明
"


                            ></el-input>
                        </el-form-item>
                        <el-form-item>
                            <el-button type="primary" @click="submitUpload">立即创建</el-button>
                            <el-button>取消</el-button>
                        </el-form-item>
                    </el-form>


            </div>
        </el-card>
    </div>


</template>

<script>
    export default {
        name: "ResourceUpload",
        data() {
            return {
                form: {
                    user: localStorage.getItem("user")?JSON.parse(localStorage.getItem("user")):{},
                    name: '',
                    region: '',
                    date1: '',
                    date2: '',
                    delivery: false,
                    type: [],
                    resource: '',
                    desc: '',
                    form:{},
                    filename:"",
                    briefResource:""

                }
            }
        },
        created() {
            this.user=  localStorage.getItem("user")?JSON.parse(localStorage.getItem("user")):{}
        },
        methods:{
            submitUpload() {
                this.$refs.upload.submit();
                this.$message.success("上传成功！")
                this.$router.push('/front/home')
            },
        }
    }
</script>

<style scoped>

</style>