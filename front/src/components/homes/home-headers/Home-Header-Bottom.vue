<script setup>

</script>

<template>
  <div class="container">
    <router-link to="/home/normal-product">
      <el-button>普通商品</el-button>
    </router-link>
    <router-link to="spikes-product">
      <el-button>秒杀商品</el-button>
    </router-link>

  </div>
</template>

<style scoped>
.container{
  height: 100%;
  display: flex;
  align-items: flex-end;
  justify-content: center;
}
</style>