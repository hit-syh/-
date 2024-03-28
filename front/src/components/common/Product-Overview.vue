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
    <el-image  style="width: 200px; height: 200px" v-if="product.productImageUrl!=='null'" :src="product.productImageUrl" fit="fill" />
    <el-image style="width: 200px; height: 200px" v-else src="/img.png" fit="fill" />
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
img{
  width: 200px;
  height: 200px;

}
.description{
  display: flex;
  justify-content: space-around;
}
</style>