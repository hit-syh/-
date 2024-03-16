<script setup>

import HomeHeader from "@/components/homes/Home-Header.vue";
import HomeBody from "@/components/homes/Home-Body.vue";
</script>

<template>
  <div class="container">
  <HomeHeader class="header"></HomeHeader>

  <HomeBody class="body"></HomeBody>
  </div>
</template>

<style scoped>
  .container{
    width: 100%;
    height: 100%;
  }
  .header{
    height: 30%
  }
  .body{
  }
</style>