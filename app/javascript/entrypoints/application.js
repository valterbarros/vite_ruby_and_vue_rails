console.log('Vite ⚡️ Rails')

import Router from '~/routes.js';
import Layout from '~/views/Layout.vue';
import { createApp } from 'vue';
import '~/index.css'
import pdfJsWorkerUrl from 'pdfjs-dist/legacy/build/pdf.worker.min?url';
console.log('pdfJsWorkerUrl', pdfJsWorkerUrl);
console.log(Date.now());

// console.log('Visit the guide for more information: ', 'https://vite-ruby.netlify.app/guide/rails')

(async () => {
  const { vite_version } = await import('~/index.js');
  console.log('vite_version', vite_version);
})();

const app = createApp(Layout);
app.use(Router)
  .mount('#app')
