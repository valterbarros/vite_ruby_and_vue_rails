import VueRouter from 'vue-router'
// import Page from '~/views/Page.vue'

const router = new VueRouter({
  mode: 'history',
  routes: [
    { path: '/route', component: () => import('@views/Page.vue'), name: 'root_path' },
  ]
});

export default router;
