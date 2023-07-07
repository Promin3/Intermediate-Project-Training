<template>
    <div class="personalData">
<!--        头像展示 及 个人简介-->
        <div class="avaOfpersonalData">
<!--            头像-->
            <div class="avaOf_avaOfpersonalData">
                <el-upload
                        style="text-align: center;"
                        class="avatarOfuploader"
                        action="http://localhost:9090/file/upload"
                        :show-file-list="false"
                        :on-success="handleAvatarSuccess"
                >
                    <img v-if="allInforOfPerson.avatarUrl" :src="user.avatarUrl" class="avatar">
                    <i v-else class="el-icon-plus avatar-uploader-icon" style="border-radius: 50%"></i>
                </el-upload>
            </div>
<!--           个人简介 -->
            <div class="PersonalDataView">
<!--                nickname-->
                <div class="nicknameOfUserDate">
                    <div style="font-size: 20px;color:#222226">
                        {{allInforOfPerson.nickname}}
                    </div>
                </div>
<!--                个人简介-->
                <div class="dataOfPersonalDataView">
                    <div style="font-size: 14px;color: #555666">
                        个人简介:
                    </div>
                    <div style="color: #555666;font-size: 14px;margin-top: 10px">
                        {{allInforOfPerson.brief}}
                    </div>
                </div>
            </div>
        </div>
<!--        基本信息-->
        <div class="baseDataOfPersonalData">
<!--            表头-->
            <div style=" flex: 2;display: flex;align-items: center;border-bottom: 1px solid #F2F2F2 ">
                    <span style="flex: 10;font-size: 18px;font-weight: 600;padding-left: 30px">基本信息</span>
                <div v-if="!this.baseDataEdit" style=";flex:2">
                  <div>
                      <el-button type="primary" round  @click="baseDataEditShow">确定修改</el-button>
                  </div>
                </div>
            </div>
<!--            表身-->
            <div class="showEditInforOfEditInfor" style="flex: 8;display: flex;flex-direction: column ;" v-if="!this.baseDataEdit" >
                <div style="flex:1;display: flex;align-items: center;">
                    <div style="flex:1; font-size: 14px;color: #555666;margin: 0px 40px;letter-spacing: 1px;">
                        <span >用户昵称:</span>
                    </div>
                    <div style="font-size: 14px;color: #555666;flex: 13;letter-spacing: 2px;">
                        <el-input v-model="allInforOfPerson.nickname" style="width: 100px;text-align: center" placeholder="请输入内容"></el-input>
                    </div>
                </div>
                <div style="flex:1;display: flex;align-items: center;;letter-spacing: 1px;">
                    <div style="flex:1; font-size: 14px;color: #555666;margin: 0px 40px;letter-spacing: 1px;">
                        <span style="">用户&ensp;ID:</span>
                    </div>
                    <div style="font-size: 14px;color: #555666;flex: 13">
                        <el-input v-model="allInforOfPerson.id" :disabled="true" style="width: 100px;text-align: center" placeholder="请输入内容"></el-input>
                    </div>
                </div>
                <div style="flex:1;display: flex;align-items: center;letter-spacing: 1px;">
                    <div style="flex:1; font-size: 14px;color: #555666;margin: 0px 40px">
                        <span>性&#x3000&#x3000别:</span>
                    </div>
                    <div style="font-size: 14px;color: #555666;flex: 13">
                        <el-input v-model="allInforOfPerson.sex" style="width: 100px;text-align: center" placeholder="请输入内容"></el-input>
                    </div>
                </div>
                <div style="flex:1;display: flex;align-items: center;letter-spacing: 1px;">
                    <div style="flex:1; font-size: 14px;color: #555666;margin: 0px 40px">
                        <span>个人简介:</span>
                    </div>
                    <div style="font-size: 14px;color: #555666;flex: 13">
                        <el-input type="textarea" :rows="3" v-model="allInforOfPerson.brief" style="width: 400px;text-align: center"
                                  placeholder="请输入内容"
                                  maxlength="30"
                                  show-word-limit
                        ></el-input>
                    </div>
                </div>
                <div style="flex:1;display: flex;align-items: center;letter-spacing: 1px;">
                    <div style="flex:1; font-size: 14px;color: #555666;margin: 0px 40px">
                        <span>所在地区:</span>
                    </div>
                    <div style="font-size: 14px;color: #555666;flex: 13">
                        <el-input v-model="allInforOfPerson.address" style="width: 100px;text-align: center" placeholder="请输入内容"></el-input>
                    </div>
                </div>
                <div style="flex:1;display: flex;align-items: center;letter-spacing: 1px;">
                    <div style="flex:1; font-size: 14px;color: #555666;margin: 0px 40px">
                        <span>出生日期:</span>
                    </div>
                    <div style="font-size: 14px;color: #555666;flex: 13">
                        <el-input v-model="allInforOfPerson.birthday" style="width: 100px;text-align: center" placeholder="请输入内容"></el-input>
                    </div>
                </div>
            </div>

            <div class="showInforOfEditInfor" style="flex: 8;display: flex;flex-direction: column" v-if="this.baseDataEdit" @click="baseDataEditShowTwo">
                <div style="flex:1;display: flex;align-items: center;">
                    <div style="flex:1; font-size: 14px;color: #555666;margin: 0px 40px;letter-spacing: 1px;">
                        <span >用户昵称:</span>
                    </div>
                    <div style="font-size: 14px;color: #555666;flex: 13;letter-spacing: 2px;">
                        <span>{{allInforOfPerson.nickname}}</span>
                    </div>
                </div>
                <div style="flex:1;display: flex;align-items: center;;letter-spacing: 1px;">
                    <div style="flex:1; font-size: 14px;color: #555666;margin: 0px 40px;letter-spacing: 1px;">
                        <span style="">用户&ensp;ID:</span>
                    </div>
                    <div style="font-size: 14px;color: #555666;flex: 13">
                        <span>{{allInforOfPerson.id}}</span>
                    </div>
                </div>
                <div style="flex:1;display: flex;align-items: center;letter-spacing: 1px;">
                    <div style="flex:1; font-size: 14px;color: #555666;margin: 0px 40px">
                        <span>性&#x3000&#x3000别:</span>
                    </div>
                    <div style="font-size: 14px;color: #555666;flex: 13">
                        <span>{{allInforOfPerson.sex}}</span>
                    </div>
                </div>
                <div style="flex:1;display: flex;align-items: center;letter-spacing: 1px;">
                 <div style="flex:1; font-size: 14px;color: #555666;margin: 0px 40px">
                        <span>个人简介:</span>
                    </div>
                <div style="font-size: 14px;color: #555666;flex: 13">
                        <span>{{allInforOfPerson.brief}}</span>
                    </div>
            </div>
                <div style="flex:1;display: flex;align-items: center;letter-spacing: 1px;">
                    <div style="flex:1; font-size: 14px;color: #555666;margin: 0px 40px">
                        <span>所在地区:</span>
                    </div>
                    <div style="font-size: 14px;color: #555666;flex: 13">
                        <span>{{allInforOfPerson.address}}</span>
                    </div>
                </div>
                <div style="flex:1;display: flex;align-items: center;letter-spacing: 1px;">
                    <div style="flex:1; font-size: 14px;color: #555666;margin: 0px 40px">
                        <span>出生日期:</span>
                    </div>
                    <div style="font-size: 14px;color: #555666;flex: 13">
                        <span>{{allInforOfPerson.birthday}}</span>
                    </div>
                </div>
            </div>
        </div>
<!--        教育信息-->
        <div class="eduOfPersonalData">
            <!--            表头-->
            <div style=" flex: 2; display: flex;align-items: center;border-bottom: 1px solid #F2F2F2 ">
                <span style="flex: 10;font-size: 18px;font-weight: 600;padding-left: 30px">教育信息</span>
                <div v-if="!this.eduDataEdit" style=";flex:2">
                    <div>
                        <el-button type="primary" round  @click="eduDataEditShow">确定修改</el-button>
                    </div>
                </div>
            </div>
            <!--            表身-->
            <div  v-if="!eduDataEdit" class="eduInforDisShow" style="flex: 8;display: flex;flex-direction: column">
                <div style="flex:1;display: flex;align-items: center;letter-spacing: 1px;">
                    <div style="flex:1; font-size: 14px;color: #555666;margin: 0px 40px">
                        <span>学校名称:</span>
                    </div>
                    <div style="font-size: 14px;color: #555666;flex: 13">
                        <el-input v-model="allInforOfPerson.nameofshcool" style="width: 100px;text-align: center" placeholder="请输入内容"></el-input>
                    </div>
                </div>
                <div style="flex:1;display: flex;align-items: center;letter-spacing: 1px;">
                    <div style="flex:1; font-size: 14px;color: #555666;margin: 0px 40px">
                        <span>学&#x3000&#x3000历:</span>
                    </div>
                    <div style="font-size: 14px;color: #555666;flex: 13">
                        <el-input v-model="allInforOfPerson.education" style="width: 100px;text-align: center" placeholder="请输入内容"></el-input>
                    </div>
                </div>
                <div style="flex:1;display: flex;align-items: center;letter-spacing: 1px;">
                    <div style="flex:1; font-size: 14px;color: #555666;margin: 0px 40px">
                        <span>专&#x3000&#x3000业:</span>
                    </div>
                    <div style="font-size: 14px;color: #555666;flex: 13">
                        <el-input v-model="allInforOfPerson.major" style="width: 100px;text-align: center" placeholder="请输入内容"></el-input>
                    </div>
                </div>
                <div style="flex:1;display: flex;align-items: center;letter-spacing: 1px;">
                    <div style="flex:1; font-size: 14px;color: #555666;margin: 0px 40px">
                        <span>入学时间:</span>
                    </div>
                    <div style="font-size: 14px;color: #555666;flex: 13">
                        <el-input v-model="allInforOfPerson.schooltime" style="width: 100px;text-align: center" placeholder="请输入内容"></el-input>
                    </div>
                </div>
            </div>

            <div  v-if="eduDataEdit" class="eduInforDisShow" style="flex: 8;display: flex;flex-direction: column" @click="eduDataEditShow">
                <div style="flex:1;display: flex;align-items: center;letter-spacing: 1px;">
                    <div style="flex:1; font-size: 14px;color: #555666;margin: 0px 40px">
                        <span>学校名称:</span>
                    </div>
                    <div style="font-size: 14px;color: #555666;flex: 13">
                        <span>{{allInforOfPerson.nameofshcool}}</span>
                    </div>
                </div>
                <div style="flex:1;display: flex;align-items: center;letter-spacing: 1px;">
                    <div style="flex:1; font-size: 14px;color: #555666;margin: 0px 40px">
                        <span>学&#x3000&#x3000历:</span>
                    </div>
                    <div style="font-size: 14px;color: #555666;flex: 13">
                        <span>{{allInforOfPerson.education}}</span>
                    </div>
                </div>
                <div style="flex:1;display: flex;align-items: center;letter-spacing: 1px;">
                    <div style="flex:1; font-size: 14px;color: #555666;margin: 0px 40px">
                        <span>专&#x3000&#x3000业:</span>
                    </div>
                    <div style="font-size: 14px;color: #555666;flex: 13">
                        <span>{{allInforOfPerson.major}}</span>
                    </div>
                </div>
                <div style="flex:1;display: flex;align-items: center;letter-spacing: 1px;">
                    <div style="flex:1; font-size: 14px;color: #555666;margin: 0px 40px">
                        <span>入学时间:</span>
                    </div>
                    <div style="font-size: 14px;color: #555666;flex: 13">
                        <span>{{allInforOfPerson.schooltime}}</span>
                    </div>
                </div>
            </div>
        </div>

    </div>
</template>

<script>
    import {Axios as request} from "axios";
    export default {
        name: "UserInforEditView",
        data(){
            return{
                user: localStorage.getItem("user")?JSON.parse(localStorage.getItem("user")):{},
                baseDataEdit:true,
                eduDataEdit:true,
                allInforOfPerson:{},
            }

        },
        created() {
            this.loadAllInforOfUser()
        },
        methods:{
            loadAllInforOfUser(){
                this.request.post("/user/searchAllInfor",this.user).then(res =>{
                    this.allInforOfPerson = res.data
                })
            },
            handleAvatarSuccess(res){
                this.user.avatarUrl=res;
                const form = this.allInforOfPerson
                form.avatarUrl = res;
                this.request.post("/user", form).then(res => {
                    if (res) {
                        this.$message.success("保存成功！")
                        this.$emit("fatherRefreshInfo")
                    } else {
                        this.$message.error("保存失败！")
                    }
                })
            },
            baseDataEditShowTwo(){
                this.baseDataEdit=!this.baseDataEdit
            },
            baseDataEditShow(){
                const form = this.allInforOfPerson
                this.request.post("/user", form).then(res => {
                    if (res) {
                        this.$message.success("保存成功！")
                        this.$emit("fatherRefreshInfo")
                    } else {
                        this.$message.error("保存失败！")
                    }
                })
                this.baseDataEdit=!this.baseDataEdit
            },
            eduDataEditShow(){
                this.eduDataEdit=!this.eduDataEdit
            }
        }
    }
</script>

<style scoped>
    .eduInforDisShow{
        cursor: pointer;

    }
    .eduInforDisShow:hover{
        background-color: #EEEEEE;
    }
    .avatarOfuploader{
        border-radius: 50%;
    }
.avatar{
    width: 110px;
    height: 110px;
    border-radius: 50%;
}
.showInforOfEditInfor{
    cursor: pointer;
}
.showInforOfEditInfor:hover{
    background-color: #EEEEEE;
}
.personalData{
    gap: 20px;
    display: flex;
    flex-direction: column;
    width: 1000px;
    height: 1000px;
}
    .avaOfpersonalData{
        background-color: #FFFFFF;
        display: flex;
    flex: 2;
    }
    .baseDataOfPersonalData{
        background-color: #FFFFFF;
        flex: 5;
        flex-direction: column;
        display: flex;
    }
    .eduOfPersonalData{
        margin-bottom: 100px;
        background-color: #FFFFFF;
        flex: 5;
        flex-direction: column;
        display: flex;
    }
    .avaOf_avaOfpersonalData{
        flex: 2;
    }
    .PersonalDataView{
        display: flex;
        flex-direction: column;
        justify-content: center;
        flex: 10;
    }
    .nicknameOfUserDate{
        flex: 1;
        display: flex;
        align-items: center;
    }
    .dataOfPersonalDataView{
        flex: 2;
    }
    .msg{
        display: none;
        width: 100%;
        height: 100%;
        background-color: #8c939d;
    }
</style>