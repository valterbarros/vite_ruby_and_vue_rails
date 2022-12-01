<template>
  <div>
    counter component
    count: <span> {{ count }} </span>

    <button @click="count++">+</button>
    <button @click="count--">-</button>
  </div>
</template>

<script>
import { defineComponent, onMounted, ref } from 'vue'
import { INITIAL_COUNT, ID } from '~/utils.js'
// Force vite to create a chunk because this worker is big file
import pdfJsWorkerUrl from 'pdfjs-dist/legacy/build/pdf.worker.min?url';
// const { pathname } = new URL(pdfJsWorkerUrl);
// const url = new URL(pathname, window.location);
// const PDFJSWorker = new Worker(url, { type: 'classic' });
// console.log(PDFJSWorker);

export default defineComponent({
  setup() {
    console.log(ID);
    
    const count = ref(INITIAL_COUNT)
    
    // lifecycle hooks
    onMounted(() => {
      console.log(`log inside Counter.`)
    })

    return {
      count
    }
  }
})

</script>

<style>
.para1 {
  text-shadow: 0ch;
}
</style>