console.log('Vite ⚡️ Rails')

import Router from '~/routes.js';
import Layout from '~/views/Layout.vue';
import Vue from 'vue';
import '~/index.css'
import pdfJsWorkerUrl from 'pdfjs-dist/legacy/build/pdf.worker.min?url';
import VueRouter from 'vue-router';
console.log('pdfJsWorkerUrl', pdfJsWorkerUrl);
console.log(Date.now());

(async () => {
  const { vite_version } = await import('~/index.js');
  console.log('vite_version', vite_version);
})();

Vue.use(VueRouter)

const app = new Vue(
  {
    router: Router,
    render: (h) => h(Layout)
  }
);

app.$mount('#app')
