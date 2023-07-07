<template>
    <div class="setOfUserView">
<!--安全等级平谷区域-->
        <div class="safeLevelView">
<!--图标-->
            <div class="safeImg">
                <div style="height: 80px;width: 80px;">
                    <img v-if="safetyLevel<60" style="width: 100%;height: 100%" src="../../../assets/dangerProtect.png">
                    <img v-else-if="60<=safetyLevel &&  safetyLevel<80" style="width: 100%;height: 100%" src="../../../assets/safeLevel.png">
                    <img v-else-if="80<=safetyLevel &&  safetyLevel<=100" style="width: 100%;height: 100%" src="../../../assets/bestLevel.png">
                </div>
            </div>
<!--            风险提示-->
            <div class="riskLevel">
                <span   v-if="safetyLevel<60" style="display: block;padding: 0 10px;border-radius:10px;background-color: red;font-size: 12px;color: #ffffff ">高风险 </span>
                <span  v-else-if="60<=safetyLevel &&  safetyLevel<80" style="display: block;padding: 0 10px;border-radius:10px;background-color:#409EFF;font-size: 12px;color: #ffffff ">中风险</span>
                <span  v-else-if="80<=safetyLevel &&  safetyLevel<=100" style="display: block;padding: 0 10px;border-radius:10px;background-color:#46B312;font-size: 12px;color: #ffffff ">低风险 </span>

            </div>

<!--            绑定提示-->
            <div class="bindingTips">
            </div>
        </div>

<!--        安全信息绑定区-->
        <div class="safeDataView">
            <!--            表头-->
            <div style=" flex: 2;display: flex;align-items: center;border-bottom: 1px solid #F2F2F2 ">
                <span style="flex: 10;font-size: 18px;font-weight: 600;padding-left: 30px">账号设置</span>
            </div>
            <!--            表身-->


            <div class="showSafeDataViewTwo" style="flex: 8;display: flex;flex-direction: column"  >
                <div style="flex:1;display: flex;align-items: center;">
                    <div style="flex:15; font-size: 14px;color: #555666;margin: 0px 40px;letter-spacing: 1px;">
                        <span >密&#x3000&#x3000码:</span>
                    </div>
                    <div style="font-size: 14px;color: #555666;flex: 3;letter-spacing: 2px;">
                        <el-link type="primary" style="letter-spacing: 15px;" @click="ChangePassword">修改密码</el-link>
                    </div>
                </div>
                <div style="flex:1;display: flex;align-items: center;;letter-spacing: 1px;">
                    <div style="flex:15; font-size: 14px;color: #555666;margin: 0px 40px;letter-spacing: 1px;">
                        <span style="">手&#x3000&#x3000机:</span>
                    </div>
                    <div style="font-size: 14px;color: #555666;flex: 3">
                        <el-link v-if="!showView1" type="primary" style="letter-spacing: 3px; " @click="changePhone">绑定手机号码</el-link>
                        <el-link v-if="showView1" type="primary" style="letter-spacing: 3px;" @click="changePhone">更换手机号码</el-link>
                    </div>
                </div>
                <div style="flex:1;display: flex;align-items: center;letter-spacing: 1px;">
                    <div style="flex:15; font-size: 14px;color: #555666;margin: 0px 40px">
                        <span>邮&#x3000&#x3000箱:</span>
                    </div>
                    <div style="font-size: 14px;color: #555666;flex: 3">
                        <el-link v-if="!showView2" type="primary" style="letter-spacing: 15px;" @click="changeEmail">绑定邮箱</el-link>
                        <el-link v-if="showView2" type="primary" style="letter-spacing: 15px;" @click="changeEmail">更换邮箱</el-link>
                    </div>
                </div>
                <div style="flex:1;display: flex;align-items: center;letter-spacing: 1px;">
                    <div style="flex:15; font-size: 14px;color: #555666;margin: 0px 40px">
                        <span>注销账号:</span>
                    </div>
                    <div style="font-size: 14px;color: #555666;flex: 3">
                        <el-popover
                                placement="bottom"
                                width="160"
                                v-model="visible">
                            <p>你确定要注销账号吗？</p>
                            <div style="text-align: right; margin: 0">
                                <el-button size="mini" type="text" @click="visible = false">取消</el-button>
                                <el-button type="primary" size="mini" @click="deleteAccount" >确定</el-button>
                            </div>
                            <el-button slot="reference" type="danger" round style="width: 100px">注销账号</el-button>
                        </el-popover>

                    </div>
                </div>
            </div>

        </div>
        <el-dialog
                title="修改密码"
                :visible.sync="dialogVisibleChangePassword"
                width="30%"
                :before-close="handleClose">
            <el-input placeholder="请输入密码" v-model="inputPasswordFirst" show-password></el-input>
            <el-input placeholder="请再次输入密码" v-model="inputPasswordAgin" style="margin-top: 20px" show-password></el-input>
            <span slot="footer" class="dialog-footer">
    <el-button type="primary" @click="changePasswordSuccess">确 定</el-button>
  </span>
        </el-dialog>
        <el-dialog
                title="手机号码管理"
                :visible.sync="dialogVisibleChangePhone"
                width="30%"
                :before-close="handleClose">
            <el-input placeholder="请输入手机号码"   type="text" maxlength="11"  show-word-limit v-model="inputPhoneFirst" ></el-input>
            <el-input placeholder="请再次手机号码"   type="text" maxlength="11"  show-word-limit v-model="inputPhoneAgain" style="margin-top: 20px" ></el-input>
            <span slot="footer" class="dialog-footer">
    <el-button type="primary" @click="changePhoneSuccess">确 定</el-button>
  </span>
        </el-dialog>
        <el-dialog
                title="邮箱管理"
                :visible.sync="dialogVisibleChangeEmail"
                width="30%"
                :before-close="handleClose">
            <el-input placeholder="请输邮箱"   type="text"    v-model="inputEmailFirst" ></el-input>
            <el-input placeholder="请再次输入邮箱"   type="text"   v-model="inputEmailAgain" style="margin-top: 20px" ></el-input>
            <span slot="footer" class="dialog-footer">
    <el-button type="primary" @click="changeEmailSuccess">确 定</el-button>
  </span>
        </el-dialog>
    </div>



</template>

<script>
    export default {
        name: "SetOfUserView",
        data(){
            return{
                safetyLevel:0,
                user: localStorage.getItem("user")?JSON.parse(localStorage.getItem("user")):{},
                allInforOfPerson:{},
                visible: false,
                showView1:false,
                showView2:false,
                dialogVisibleChangePassword: false,
                dialogVisibleChangePhone:false,
                dialogVisibleChangeEmail:false,
                inputPasswordFirst:"",
                inputPasswordAgin:"",
                inputEmailFirst:"",
                inputEmailAgain:"",
                inputPhoneFirst:"",
                inputPhoneAgain:"",
            }
        },
        created() {
            this.loadAllInforOfUser()
        },
        methods:{
            deleteAccount(){
                this.request.delete("/user/"+this.user.id).then(res =>{
                    if(res){
                        this.$message.success("注销成功，期待与你的再次相逢！")
                        this.$store.commit("logoutFront")
                    }else{
                        this.$message.error("注销失败！")
                    }
                    this.load()
                })
            },
            ChangePassword(){
                this.dialogVisibleChangePassword=!this.dialogVisibleChangePassword
            },
            changePhone(){
                this.dialogVisibleChangePhone = !this.dialogVisibleChangePhone
            },
            changeEmail(){
                this.dialogVisibleChangeEmail=!this.dialogVisibleChangeEmail
            },
            changeEmailSuccess(){
                if(this.inputPhoneFirst!=this.inputPhoneAgain)
                {
                    this.$message.error("两次邮箱输入不同，请重新输入！")
                    return false
                }else{
                    const form = this.allInforOfPerson
                    form.email=this.inputEmailFirst
                    this.request.post("/user", form).then(res => {
                        if (res) {
                            this.$message.success(  "修改成功!")
                            this.inputEmailFirst=""
                            this.inputEmailAgain=""
                            this.dialogVisibleChangeEmail = !this.dialogVisibleChangeEmail
                            this.loadAllInforOfUser()
                        } else {
                            this.$message.error("修改失败！")
                        }
                    })
                }
            },
            changePhoneSuccess(){
                if(this.inputPhoneFirst!=this.inputPhoneAgain)
                {
                    this.$message.error("两次手机号码输入不同，请重新输入！")
                    return false
                }else{
                    const form = this.allInforOfPerson
                    form.phone=this.inputPhoneFirst
                    this.request.post("/user", form).then(res => {
                        if (res) {
                            this.$message.success(  "修改成功!")
                            this.inputPhoneFirst=""
                            this.inputPhoneAgain=""
                            this.dialogVisibleChangePhone = !this.dialogVisibleChangePhone
                            this.loadAllInforOfUser()
                        } else {
                            this.$message.error("修改失败！")
                        }
                    })
                }

            },
            loadAllInforOfUser(){
                this.request.post("/user/searchAllInfor",this.user).then(res =>{
                    this.allInforOfPerson = res.data
                    console.log(this.allInforOfPerson.email)
                    if(this.allInforOfPerson.email==""  &&  this.allInforOfPerson.phone=="")
                    {
                        this.showView1=false
                        this.showView2=false
                        this.safetyLevel=0
                    }else if( this.allInforOfPerson.email=="" && this.allInforOfPerson.phone!="")
                    {
                        this.showView1=true
                        this.showView2=false
                        this.safetyLevel=70
                    }else if( this.allInforOfPerson.email!="" && this.allInforOfPerson.phone=="")
                    {
                        this.showView2=true
                        this.showView1=false
                        this.safetyLevel=70
                    }
                    else{
                        this.showView1=true
                        this.showView2=true
                        this.safetyLevel=100;
                    }
                })

                // if(email2===""  && phone2==="")
                // {
                //     this.safetyLevel=0;
                // }else if( email2==="" ||  phone2==="")
                // {
                //     this.safetyLevel=70;
                // }else{
                //     this.safetyLevel=100;
                // }
            },
            // loadSafeScore(){
            //

            //
            // },
            handleClose(done) {
                this.$confirm('正在修改个人信息，你确定退出吗？')
                    .then(_ => {
                        done();
                    })
                    .catch(_ => {});
            },
            changePasswordSuccess(){
                if(this.inputPasswordAgin!=this.inputPasswordFirst)
                {
                    this.$message.error("两次密码输入不同，请重新输入！")
                    return false
                }else{
                    const form = this.allInforOfPerson
                    form.password=this.inputPasswordFirst
                    this.request.post("/user", form).then(res => {
                        if (res) {
                            this.$message.success("修改成功，请重新登录！")
                            this.$store.commit("logoutFront")

                        } else {
                            this.$message.error("保存失败！")
                        }
                    })
                }
            }

        }
    }

</script>

<style scoped>
.setOfUserView{
    display: flex;
    flex-direction: column;
    height: 600px;
    gap: 10px;
    width: 1000px;
}
    .safeLevelView{
        flex: 2;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        background-color: #FFFFFF;
    }
    .safeDataView{
        background-color: #FFFFFF;
        flex: 6;
        flex-direction: column;
        display: flex;
        margin-bottom: 50px;
    }
    .safeImg{
        flex: 5;
    }
    .riskLevel{
        flex: 1;
    }
    .bindingTips{
        flex: 1;
        width: 1000px;
    }
</style>