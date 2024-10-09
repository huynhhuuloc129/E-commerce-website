import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
   
    {
      path: '/',
      name: 'home',
      component: () => import('../views/HomePage.vue')
    },
    {
      path: '/personal',
      name: 'personal',
      component: () => import('../views/PersonalPage.vue')
    },
    {
      path: '/login',
      name: 'login',
      component: () => import('../views/LoginPage.vue'),
      meta: {
        hideNavbar: true
      }
    },
    {
      path: '/signup',
      name: 'signup',
      component: () => import('../views/SignUpPage.vue'),
      meta: {
        hideNavbar: true
      }
    },
    {
      path: '/cart',
      name: 'cart',
      component: () => import('../views/CartPage.vue')
    },
    {
      path: '/admin',
      name: 'admin',
      component: () => import('../views/AdminPage.vue')
    },
    {
      path: '/products/:id',
      name: 'products',
      component: () => import('../views/ProductsPage.vue')
    },
    {
      path: '/search/:content',
      name: 'search',
      component: () => import('../views/SearchPage.vue')
    },
    {
      path: '/tag/:id',
      name: 'tag',
      component: () => import('../views/TagsPage.vue')
    },
    {
      path: '/brand/:id',
      name: 'brand',
      component: () => import('../views/BrandPage.vue')
    }
  ]
})

export default router