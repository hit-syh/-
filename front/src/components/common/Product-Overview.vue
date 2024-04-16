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
  <el-image  v-if="product.productImageUrl!=='null'" :src="product.productImageUrl" fit="fill" />
  <el-image  v-else src="/img.png" fit="fill" />
  <div><P>{{product.productTitle+" "+product.price+"⚪"}}</P></div>
</div>
</template>

<style scoped>
.container{
  display: flex;
  height: 100%;
  width: 100%;
  flex-direction: column;
  justify-content: center;
  text-align: center;
}
</style>