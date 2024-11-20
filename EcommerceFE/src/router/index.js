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
        hideNavbar: true,
        hideChatbot: true
      }
    },
    {
      path: '/signup',
      name: 'signup',
      component: () => import('../views/SignUpPage.vue'),
      meta: {
        hideNavbar: true,
        hideChatbot: true
      }
    },
    {
      path: '/cart',
      name: 'cart',
      component: () => import('../views/CartPage.vue'),
      meta: {
        hideCart: true,
      }
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
      path: '/edit/:id',
      name: 'editProduct',
      component: () => import('../views/EditProductPage.vue')
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
    },
    {
      path: '/category/:id',
      name: 'category',
      component: () => import('../views/CategoryPage.vue')
    },
    {
      path: '/orders',
      name: 'orders',
      component: () => import('../views/ordersDetail.vue')
    }
  ],
  scrollBehavior(to, from, savedPosition) {
    if (savedPosition) {
      // Scroll to the saved position if navigating back
      return savedPosition;
    } else {
      // Scroll to top when navigating to a new route
      return { top: 0 };
    }
  },
})

export default router