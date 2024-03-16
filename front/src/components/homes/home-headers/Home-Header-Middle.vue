<script setup>

import {Search} from "@element-plus/icons-vue";
</script>

<template>
<div class="container">
  <el-input class="search-box"></el-input>
  <el-button round class="search-button"><p style="padding-right: 0.2rem;">搜索</p><el-icon><Search /></el-icon></el-button>
</div>
</template>

<style scoped>
.container{
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: rebeccapurple !important;
  height: 100%;
  gap: 0.5rem;
}
.search-box{
  width: 30rem;
  height: 2rem;
}
.search-button{
  height: 2rem;
  width: 5rem;
}
</style>