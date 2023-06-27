import Vue from 'vue'
import App from './App.vue'
import router from './router/index.js'
import store from './store'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import axios from 'axios'
import VueAxios from 'vue-axios'


Vue.config.productionTip = false
Vue.use(ElementUI);
Vue.use(VueAxios,axios)

new Vue({
  render: h => h(App),
  router,
  store,
  
}).$mount('#app')
