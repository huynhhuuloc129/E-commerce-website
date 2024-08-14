import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
   
    // {
    //   path: '/upload-post',
    //   name: 'upload post',
    //   component: () => import('../views/UploadPost.vue')
    // },
    // {
    //   path: '/admin',
    //   name: 'admin',
    //   component: () => import('../views/AdminPage.vue')
    // },
    // {
    //   path: '/tag/:id',
    //   name: 'tag',
    //   component: () => import('../views/ListPostTags.vue')
    // }
    // ,
    // {
    //   path: '/search/:content',
    //   name: 'search',
    //   component: () => import('../views/SearchPost.vue')
    // }
  ]
})

export default router