<script setup>

import HomeHeaderTop from "@/components/homes/home-headers/Home-Header-Top.vue";
import HomeHeaderMiddle from "@/components/homes/home-headers/Home-Header-Middle.vue";
import HomeHeaderBottom from "@/components/homes/home-headers/Home-Header-Bottom.vue";
</script>

<template>
  <div class="container">
    <div class="top">
    <HomeHeaderTop></HomeHeaderTop>
    </div>
    <div class="middle">
      <HomeHeaderMiddle></HomeHeaderMiddle>
    </div>
    <div class="bottom">
      <HomeHeaderBottom></HomeHeaderBottom>
    </div>
  </div>
</template>

<style scoped>
.container {
  background-color: lightskyblue;
}
.top{
  height: 20%;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 2%;
}
.middle{
  margin: 2rem;
  height:30%;
}
.bottom{
  height:20%;
}
</style>