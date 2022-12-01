<template>
  <div>
    layout
    <router-view />

    <router-link to="/route"> go to page 1 </router-link>
  </div>
</template>

<script>
import { defineComponent } from 'vue';

  defineComponent({
    setup(){}
  });
</script>

<style>
.para3 {
  text-shadow: 0ch;
}
</style>