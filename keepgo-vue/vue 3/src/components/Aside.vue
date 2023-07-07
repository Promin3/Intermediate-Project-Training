<template>
    <el-menu :default-openeds="['1', '3']" style="height: 100%;width: 100%"
             background-color="rgb(53,93,125)"
             text-color="#fff"
             active-text-color="rgb(248,178,149)"
             :collapse-transition="false"
             :collapse="isCollapse"
             router
             @select="handleSelect"
    >
        <div style="height: 60px;line-height: 60px;text-align: center">
            <img src="../assets/star.png" style="position: relative;top: 10px;margin-right: 5px" >
            <b style="color:#ffffff;" v-show="logalTextShow">后台管理系统</b>
        </div>

        <el-submenu index="2">
            <template slot="title"><i class="el-icon-menu"></i><span>系统管理</span></template>
<!--            <el-menu-item-group>-->
            <!--                <template slot="title">用户管理</template>-->
            <!--            </el-menu-item-group>-->
<!--            <el-menu-item-group title="">-->
                <el-menu-item index="/home"><i class="el-icon-user-solid"></i>用户管理</el-menu-item>
            <el-menu-item index="/collection"><i class="el-icon-folder"></i>收藏管理</el-menu-item>
            <el-menu-item index="/data"><i class="el-icon-folder"></i>数据分析</el-menu-item>
            <el-menu-item index="/video"><i class="el-icon-folder"></i>视频管理</el-menu-item>
            <el-menu-item index="/article"><i class="el-icon-tickets"></i>文章管理</el-menu-item>
            <el-menu-item index="/comment"><i class="el-icon-tickets"></i>评论管理</el-menu-item>
            <el-menu-item index="/category"><i class="el-icon-tickets"></i>文章类别管理</el-menu-item>
            <el-menu-item index="/loginlog"><i class="el-icon-tickets"></i>登录日志</el-menu-item>
<!--            Carousel.vue-->

<!--            </el-menu-item-group>-->
<!--            <el-submenu index="2-4">-->
<!--                <template slot="title">选项4</template>-->
<!--                <el-menu-item index="2-4-1">选项4-1</el-menu-item>-->
<!--            </el-submenu>-->
        </el-submenu>
<!--        <el-submenu index="3">-->
<!--            <template slot="title"><i class="el-icon-setting"></i><span>导航三</span></template>-->
<!--            <el-menu-item-group>-->
<!--                <template slot="title">分组一</template>-->
<!--                <el-menu-item index="3-1">选项1</el-menu-item>-->
<!--                <el-menu-item index="3-2">选项2</el-menu-item>-->
<!--            </el-menu-item-group>-->
<!--            <el-menu-item-group title="分组2">-->
<!--                <el-menu-item index="3-3">选项3</el-menu-item>-->
<!--            </el-menu-item-group>-->

<!--        </el-submenu>-->
    </el-menu>
</template>

<script>
    export default {
        name: "Aside",
        props:{
            isCollapse:Boolean,
            logalTextShow:Boolean,
            sideWidth:200,
        },
        created() {
        },
        methods:{
            handleSelect(index){
                console.log(this.$route)
            }
        }
    }
</script>

<style scoped>

</style>