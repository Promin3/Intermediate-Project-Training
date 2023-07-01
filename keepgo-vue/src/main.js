import { createApp } from 'vue'
import App from './App.vue'
import router from './router/index.js'

// ElementPlus + icons
import ElementPlus, { ElCheckTag } from 'element-plus'
import 'element-plus/dist/index.css'
import * as Icons from '@element-plus/icons-vue'
//axios
import axios from 'axios'
//Echarts
import  ECharts  from 'vue-echarts'
import "echarts"
import store from './store/index.js'

const app = createApp(App).component('e-charts',ECharts).use(router).use(store).use(ElementPlus).mount('#app')
// 通过遍历的方式注册所有 svg组件，会牺牲一点点性能
for (let i in Icons) {
    app.component(i, Icons[i])
}

app.config.globalProperties.$http = axios