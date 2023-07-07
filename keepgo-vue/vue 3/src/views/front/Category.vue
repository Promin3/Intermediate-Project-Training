<template>
    <div class="allViewOfCategory">
        <div class="viewOfCategory">
            <div v-for="item in catefory" style="display: flex;justify-content: center;width: 600px;height: 500px;flex-direction: column;">
<!--                名称 简介 以及 背景图片-->
                <div  class="headView" :style="{backgroundImage:'url('+item.url+')',backgroundSize: 'contain'}" >
<!--                    名称-->
                    <div style="flex: 1;padding-top: 40px;padding-left: 30px;color: #ffffff;font-size: 20px">
                        {{item.name}}
                    </div>
<!--                    简介-->
                    <div style="flex: 3;padding-left: 30px;padding-right: 200px;color: #ffffff;">
                        {{item.content}}
                    </div>
                </div>

<!--                每个专题中的最热的文章的展示-->
                <div style="flex: 1;display: flex;flex-direction: column;background: #ffffff">
                    <div v-for="childs in item.children" style="color: #222226;font-size: 15px;flex: 1;padding: 0px 30px;display: flex;flex-direction:column; justify-content: center">
                       <div class="headOfTypechild" style="flex: 1;align-items: center;display: flex" @click="$router.push('/front/articleDetail?id='+childs.id)">
                           {{childs.name}}
                       </div>
                        <div style="flex: 1;align-items: center;display: flex;font-size: 13px;color:#999AAA">
                            {{childs.time}}
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import {Axios as request} from "axios";
    export default {
        name: "Category",
        data(){
            return{
                catefory:[]
            }
        },
        created() {
            this.loadInforOfCategory()
        },
        methods:{
            loadInforOfCategory(){
                this.request.get("/type").then(res=>{
                    this.catefory = res.data
                })
            }
        }
    }
</script>

<style scoped>
    .headView{
        background-size: 100%;
        background: rgba(255,255,255,0.5);
        flex: 1;
        display: flex;
        flex-direction: column;
    }
.allViewOfCategory{
    display: flex;
    justify-content: center;

}
    .viewOfCategory{
        margin-top: 20px;
        display: flex;
        flex-flow: wrap;
        row-gap: 20px;
        column-gap: 20px;
        width: 1220px;
    }
    .headOfTypechild{
        cursor: pointer;
    }
</style>