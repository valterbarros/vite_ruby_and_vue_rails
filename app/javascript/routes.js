import { createWebHistory, createWebHashHistory, createRouter } from 'vue-router'
// import Page from '~/views/Page.vue'

const router = createRouter({
  history: createWebHashHistory(),
  routes: [
    { path: '/route', component: () => import('@views/Page.vue'), name: 'root_path' },
  ]
});

export default router;
