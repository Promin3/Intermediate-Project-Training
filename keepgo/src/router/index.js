import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from '../views/Login.vue'
import Register from '../views/Register.vue'
import Home from '../views/Home.vue'
import Video from '../views/ForeStage/Video.vue'
import Team from '../views/ForeStage/Team.vue'
import Schedule from '../views/ForeStage/Schedule'
import PersonCenter from '../views/ForeStage/PersonCenter'

Vue.use(VueRouter)

const routes = [
   {
    path: '/',
    redirect:'/Login',
    component: Login
  },  
  {
    path: '/Login',
    name: 'Login',
    component: Login
  },
  {
    path: '/Register',
    name: 'Register',
    component: Register
  },
  {
    path: '/Home',
    name: 'Home',
    component: Home,
    children:[
      {
        path:'/Video',
        name:'Video',
        component:Video
      },
      {
        path:'/Team',
        name:'Team',
        component:Team
      },
      {
        path:'/Schedule',
        name:'Schedule',
        component:Schedule
      },
      {
        path:'/PersonCenter',
        name:'PersonCenter',
        component:PersonCenter
      }
    ]
  },
]

const router = new VueRouter({
  routes
})

export default router
