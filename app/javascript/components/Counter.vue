<template>
  counter component
  count: {{ count }}

  <button @click="count++">+</button>
  <button @click="count--">-</button>
</template>

<script>
import { defineComponent, onMounted, ref } from 'vue'
import { INITIAL_COUNT, ID } from '~/utils.js'
// Force vite to create a chunk because this worker is big file
import pdfJsWorkerUrl from 'pdfjs-dist/legacy/build/pdf.worker.min?url';
const PDFJSWorker = new Worker(pdfJsWorkerUrl, { type: 'classic' });
console.log(PDFJSWorker);

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