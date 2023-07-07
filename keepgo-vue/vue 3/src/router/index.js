import Vue from 'vue'
import VueRouter from 'vue-router'
import store from "@/store";
Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Manage',
    component: ()=> import("../views/Manage.vue"),
    redirect:'/home',
    children: [
      {
        path:'home',
        name:'首页',
        component: ()=> import("../views/Home.vue"),
      },
      {
        path:'collection',
        name:'收藏管理',
        component:()=>import("../views/Collection.vue"),
      },
      {
          path:'data',
          name:'数据分析',
          component:()=>import("../views/Data.vue"),
      },
      {
        path:'video',
        name:'视频管理',
        component: ()=> import("../views/Video.vue"),
      },
      {
        path:'category',
        name:'文章类型管理',
        component: ()=> import("../views/CategoryControlerView.vue"),
      },
      {
        path:'user',
        name:'用户管理',
        component: ()=> import("../views/User.vue"),
      },
      {
        path:'person',
        name:'用户信息',
        component: ()=> import("../views/Person.vue"),
      },
      {
        path:'comment',
        name:'评论管理',
        component: ()=> import("../views/Comment.vue"),
      },
      {
        path:'loginlog',
        name:'登录日志',
        component: ()=> import("../views/Loginlog.vue"),
      },
      {
        path:'article',
        name:'文章管理',
        component: ()=> import("../views/Article.vue"),
      },
    ]

  },
  
  {
    path: '/login',
    name: 'login',
    component: () => import('../views/Login.vue')
  },


  {
    path:'/prehome',
    component:()=> import("../views/front/PreHome.vue"),
    redirect:'/prehome/video',
    children:[
          {
            path:'video',
            component: ()=>import("../views/front/Video.vue"),
            redirect:'/prehome/video/video1',
            children:[
              {
                path:'video1',
                component: () =>import("../views/front/videos/video1.vue")
              },
              {
                path:'video2',
                component: () =>import("../views/front/videos/video2.vue")
              },
              {
                path:'video3',
                component: () =>import("../views/front/videos/video3.vue")
              },
              {
                path:'video4',
                component: () =>import("../views/front/videos/video4.vue")
              },
              {
                path:'video5',
                component: () =>import("../views/front/videos/video5.vue")
              },
              {
                path:'video6',
                component: () =>import("../views/front/videos/video6.vue")
              },
              {
                path:'video7',
                component: () =>import("../views/front/videos/video7.vue")
              }
            ]
          },
 
          {
            path:'schedule',
            component: ()=> import("../views/front/Schedule.vue")
          }
        ]
  },


  {
    path: '/front',
    name: 'Front',
    component: () => import('../views/front/Front.vue'),
    redirect:'/front/home',
    children: [
      {
        path:'home',
        name:'FrontHome',
        component: ()=> import("../views/front/Home.vue"),
        redirect:'/front/article',
        children: [
          {
            path:'recomandArticleOfHomeView',
            name:'RecomandArticleOfHomeView',
            component: ()=> import("../views/front/recomandArticleOfHomeView.vue"),
          }
        ]
      },
      {
        path:'article',
        name:'FrontArticle',
        component: ()=> import("../views/front/Article.vue"),
      },
      {
        path: 'im',
        name: 'Im',
        component: () => import("../views/front/im.vue"),
      },

      {
        path:'articleDetail',
        name:'FrontArticleDetail',
        component: ()=> import("../views/front/ArticleDetail.vue"),
      },
      {
        path: 'personalCenter',
        name: 'PersonalCenter',
        component: () => import(/* webpackChunkName: "about" */ '../views/front/PersonalCenter.vue'),
        children: [
          {
            path:'newArticleOfPersonal',
            name:'NewArticleOfPersonal',
            component: ()=> import("../views/front/PersonalView/NewArticle"),
          },
          {
            path:'newResoucesView',
            name:'NewResoucesView',
            component: ()=> import("../views/front/PersonalView/NewResoucesView.vue"),
          },
          {
            path:'personalCollectView',
            name:'PersonalCollectView',
            component: ()=> import("../views/front/PersonalView/PersonalCollectView"),
          },
        ]


      },
      {
        path:'editMaterial',
        name:'EditMaterials',
        component: ()=> import("../views/front/EditMaterials.vue"),
        children: [
          {
            path: 'userInforEdit',
            name: 'UserInforEdit',
            component: () => import(/* webpackChunkName: "about" */ '../views/front/EditView/UserInforEditView')
          },
          {
            path: 'setOfUserView',
            name: 'SetOfUserView',
            component: () => import(/* webpackChunkName: "about" */ '../views/front/EditView/SetOfUserView.vue')
          },
          {
            path: 'ArticleCommand',
            name: 'articleCommand',
            component: () => import(/* webpackChunkName: "about" */ '../views/front/EditView/ArticleEditManage.vue')
          },
          {
            path: 'resourcesEditManage.vue',
            name: 'ResourcesEditManage.vue',
            component: () => import(/* webpackChunkName: "about" */ '../views/front/EditView/ResourcesEditManage.vue')
          },

        ]

      },

    ],

  },
  {
    path: '/front/login',
    name: 'FrontLogin',
    component: () => import(/* webpackChunkName: "about" */ '../views/front/Login.vue')
  },
  {
    path: '/front/register',
    name: 'register',
    component: () => import(/* webpackChunkName: "about" */ '../views/front/Register.vue')
  },
  {
    path: '/release',
    name: 'ArticleRelease',
    component: () => import(/* webpackChunkName: "about" */ '../views/front/ArticleRelease.vue')
  },


]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

//路由守卫
router.beforeEach((to,from,next)=>{
  localStorage.setItem("currentPathName",to.name),//设置当前的路由名称
      next()//放行
})

// 提供一个重置路由的方法
export const resetRouter = () => {
  router.matcher = new VueRouter({
    mode: 'history',
    base: process.env.BASE_URL,
    routes
  })
}

// 注意：刷新页面会导致页面路由重置
export const setRoutes = () => {
  const storeMenus = localStorage.getItem("menus");
  if (storeMenus) {

    // 获取当前的路由对象名称数组
    const currentRouteNames = router.getRoutes().map(v => v.name)
    if (!currentRouteNames.includes('Manage')) {
      // 拼装动态路由
      const manageRoute = { path: '/', name: 'Manage', component: () => import('../views/Manage.vue'), redirect: "/home", children: [
          // { path: 'person', name: '个人信息', component: () => import('../views/Person.vue')},
          // { path: 'password', name: '修改密码', component: () => import('../views/Password.vue')}
        ] }
      const menus = JSON.parse(storeMenus)
      menus.forEach(item => {
        if (item.path) {  // 当且仅当path不为空的时候才去设置路由
          let itemMenu = { path: item.path.replace("/", ""), name: item.name, component: () => import('../views/' + item.pagePath + '.vue')}
          manageRoute.children.push(itemMenu)
        } else if(item.children.length) {
          item.children.forEach(item => {
            if (item.path) {
              let itemMenu = { path: item.path.replace("/", ""), name: item.name, component: () => import('../views/' + item.pagePath + '.vue')}
              manageRoute.children.push(itemMenu)
            }
          })
        }
      })
      // 动态添加到现在的路由对象中去
      router.addRoute(manageRoute)
    }

  }
}

// 重置我就再set一次路由
setRoutes()


router.beforeEach((to, from, next) => {
  localStorage.setItem("currentPathName", to.name)  // 设置当前的路由名称
  store.commit("setPath")

  // 未找到路由的情况
  if (!to.matched.length) {
    const storeMenus = localStorage.getItem("menus")
    if (storeMenus) {
      next("/404")
    } else {
      // 跳回登录页面
      next("/login")
    }
  }
  // 其他的情况都放行
  next()

})

/* 路由异常错误处理，尝试解析一个异步组件时发生错误，重新渲染目标页面 */
router.onError((error) => {
  const pattern = /Loading chunk (\d)+ failed/g;
  const isChunkLoadFailed = error.message.match(pattern);
  const targetPath = router.history.pending.fullPath;
  if(isChunkLoadFailed){
    router.replace(targetPath);
  }
})


export default router