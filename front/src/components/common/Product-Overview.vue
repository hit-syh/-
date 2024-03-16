<script setup>
import {useRouter} from "vue-router";

const props=defineProps(["product"])
const product=props.product
const router=useRouter()
const openProductInfo=()=>{
  window.open("/product-info/"+product.productId)
}
</script>

<template>
<div class="container" @click="openProductInfo">
  <div class="image" >
    <img src="/img.png" class="img">
  </div>
  <div class="description">
    {{product.productTitle}}
    {{product.price+"⚪"}}
  </div>
</div>
</template>

<style scoped>
.container{
  height: 100%;
  width: 100%;
}
.img{
  width: 100%;
}
.description{
  display: flex;
  justify-content: space-around;
}
</style>