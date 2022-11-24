<template>
  <div>
    layout
    <router-view />

    <router-link :to="{ name: 'root_path' }"> go to page 1 </router-link>
  </div>
</template>

<script setup>

</script>

<style>
.para3 {
  text-shadow: 0ch;
}
</style>