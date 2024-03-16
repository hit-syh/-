<script setup>
import {useRouter} from "vue-router";
import {productInfoRequest} from "@/js/request.js";
import {ref} from "vue";

const router=useRouter()
const productId=router.currentRoute.value.params.productId
const productInfo=ref(null)
const getProductInfo=()=>{
  productInfoRequest({productId}).then(({code, data, message})=>{
    productInfo.value=data
  })
}
getProductInfo()

</script>

<template >
  <div class="container">
    <div class="left">
      <img src="/img.png" class="image">
    </div>
    <div class="right">
      <h1>{{productInfo.productTitle}}</h1>
      <h2>{{productInfo.descript}}</h2>
      <h2>{{"剩余库存: "+productInfo.stock}}</h2>
      <h2>{{"上架时间: "+productInfo.indate}}</h2>
      <h2>{{productInfo.price+"⚪"}}</h2>
      <h2>{{"卖家:"+productInfo.customerName}}</h2>
      <h2>{{"卖家联系方式:"+productInfo.mobilePhone}}</h2>
      <el-button size="large" color="orange">购买</el-button>
    </div>
  </div>
</template>

<style scoped>
.container{
  width: 100%;
  height: 100%;
  display: flex;
  padding: 5rem;
}
.left{
  width: 50%;
  flex-direction: column;
  justify-content: flex-end;
}
.image{
  object-fit: cover;
  width: 80%;
  height: 80%;
}
.right{
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  gap: 2rem;
}
</style>