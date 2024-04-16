<script setup>
import {useRouter} from "vue-router";
import {productInfoRequest} from "@/js/request.js";
import {ref} from "vue";
import Order_Form from "@/components/common/Order-Form.vue";

const router=useRouter()
const productId=router.currentRoute.value.params.productId
const productInfo=ref(null)
const getProductInfo=()=>{
  productInfoRequest({productId}).then(({code, data, message})=>{
    productInfo.value=data
  })
}
getProductInfo()
const orderDialogIsShow=ref(false)
</script>

<template >
  <div class="container">
    <div class="left">
      <el-image  v-if="productInfo.productImageUrl!=='null'" :src="productInfo.productImageUrl"/>
      <el-image  v-else src="/img.png" />
    </div>
    <div class="right">
      <h1>{{productInfo.productTitle}}</h1>
      <h2>{{"描述: "+productInfo.descript}}</h2>
      <h2>{{"剩余库存: "+productInfo.stock}}</h2>
      <h2>{{"上架时间: "+productInfo.indate}}</h2>
      <h2>{{"价格: "+productInfo.price+"⚪"}}</h2>
      <h2>{{"卖家:"+productInfo.customerName}}</h2>
      <h2>{{"卖家联系方式:"+productInfo.mobilePhone}}</h2>
      <el-button size="large" color="orange" @click="orderDialogIsShow=true">购买</el-button>
    </div>
  </div>
  <el-dialog v-model="orderDialogIsShow">
    <Order_Form v-model="orderDialogIsShow" :productInfo="productInfo"></Order_Form>
  </el-dialog>
</template>

<style scoped>
.container{
  width: 100%;
  height: 100%;
  display: flex;
}
.left{
  width: 50%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  padding:5% 5%;
}
.right{
  padding:5% 5%;
  width: 50%;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}
</style>