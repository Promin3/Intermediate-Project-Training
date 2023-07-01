// 1. 定义路由组件.
// 也可以从其他文件导入
import { createRouter, createWebHashHistory } from 'vue-router'
import Home from '../views/forestage/Home.vue'
import Person from '../views/forestage/Person.vue'
import Community from '../views/forestage/Community.vue'
import Messages from '../views/forestage/Messages.vue'
import Schedule from '../views/forestage/Schedule.vue'
import Video from '../views/forestage/Video.vue'
import Team from '../views/forestage/Team.vue'
import Register from '../views/Register.vue'
import Login from '../views/Login.vue'


// 2. 定义一些路由
// 每个路由都需要映射到一个组件。
// 我们后面再讨论嵌套路由。
const routes = [
    {
        path: '/',
        component: Login
    },
    {
        path: '/register',
        component: Register
    },
    {
        path: '/home',
        component: Home,
        redirect:'/home/video',
        children: [
            {
                //二级导航前切记不要加/
                path: 'person',
                component: Person
            },
            {
                path: 'community',
                component: Community
            },
            {
                path: 'team',
                component: Team
            },
            {
                path: 'messages',
                component: Messages
            },
            {
                path: 'schedule',
                component: Schedule
            },
            {
                path: 'video',
                component: Video
            }
        ]
    }
]


// 3. 创建路由实例并传递 `routes` 配置
// 你可以在这里输入更多的配置，但我们在这里
// 暂时保持简单
const router = createRouter({
    // 4. 内部提供了 history 模式的实现。为了简单起见，我们在这里使用 hash 模式。
    history: createWebHashHistory(),
    routes, // `routes: routes` 的缩写
})

export default router