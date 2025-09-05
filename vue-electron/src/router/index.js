import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      component: () => import('@/views/LayoutA.vue'),
      redirect: '/Home',
      children: [
        { path: 'manange', component: () => import('@/views/CacultorA.vue') },
        { path: 'login', component: () => import('@/views/LoginPage.vue') },
        { path: 'settings', component: () => import('@/views/SettingA.vue') },
        { path: 'Home', component: () => import('@/views/HomeA.vue') },
        { path: 'charts', component: () => import('@/views/ChartsA.vue') },
        { path: 'statis', component: () => import('@/views/StaticA.vue') },
        { path: 'web', component: () => import('@/views/WebApi.vue') },
        { path: 'picture', component: () => import('@/views/PictureA.vue') },
        { path: 'model', component: () => import('@/views/LanModel.vue') },
        { path: 'safety', component: () => import('@/views/SafetyA.vue') },
        { path: 'help', component: () => import('@/views/HelpA.vue') }
      ]
    }
  ]
})

export default router
