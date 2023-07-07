import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import  '../src/assets/global.css'
import request from "./utils/request.js";
import mavonEditor from"mavon-editor"
import "mavon-editor/dist/css/index.css"

Vue.config.productionTip = false;//消除警告

Vue.use(ElementUI,{size:'mini'});
//markdown编辑器全局注册


Vue.use(mavonEditor)
new Vue({
  store,
  router,
  render: h => h(App)
}).$mount('#app')
Vue.prototype.request = request;