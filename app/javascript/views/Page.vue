<template>
  <div>
    page 1
    hello world vue!
    <Counter></Counter>
  </div>
</template>

<script>
import { defineComponent, onMounted, ref } from 'vue'
import { INITIAL_COUNT, ID } from '~/utils.js'
import Counter from '~/components/Counter.vue'

export default defineComponent({
  components: {
    Counter
  },
  setup() {
    console.log(ID);
    
    const count = ref(INITIAL_COUNT)
    
    // lifecycle hooks
    onMounted(() => {
      console.log(`log inside component.`)
    })

    return {
      count
    }
  }
})

</script>

<style>
.para2 {
  text-shadow: 0ch;
}
</style>