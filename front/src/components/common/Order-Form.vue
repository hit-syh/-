<script setup>
import {ref} from "vue";
import {addOrderRequest} from "@/js/request.js";
import {ElMessage} from "element-plus";

const props=defineProps(['productInfo'])
const productInfo=props.productInfo
const orderDialogIsShow=defineModel()
const form = ref({
  shippingUser: "",
  province: "黑龙江",
  city: "哈尔滨",
  district: "南岗区",
  address: "HIT",
  paymentMethod: 0,
  productId: productInfo.productId,
  productCnt: 1,
})
const addOrder=()=>{
  addOrderRequest(form.value).then((code,data,message)=>{
    if(code==200){
      const orderId=data;
      ElMessage.info("下单成功");
    }
    orderDialogIsShow.value=false;
  })
}
</script>

<template>
  <el-form v-model="form">
    <el-form-item label="姓名">
      <el-input v-model="form.shippingUser"></el-input>
    </el-form-item>
    <el-form-item label="省份">
      <el-input v-model="form.province"></el-input>
    </el-form-item>
    <el-form-item label="城市">
      <el-input v-model="form.city"></el-input>
    </el-form-item>
    <el-form-item label="地区">
      <el-input v-model="form.district"></el-input>
    </el-form-item>
    <el-form-item label="地址">
      <el-input v-model="form.address"></el-input>
    </el-form-item>
    <el-form-item label="支付方式">
      <el-select v-model="form.paymentMethod">
        <el-option label="余额" :value="0"></el-option>
        <el-option label="支付宝" :value="1"></el-option>

      </el-select>
    </el-form-item>
    <el-form-item label="商品">
      <el-text>{{productInfo.productTitle}}</el-text>
    </el-form-item>
    <el-form-item label="购买数量">
      <el-input-number v-model="form.productCnt"></el-input-number>
    </el-form-item>
  </el-form>
  <div class="buttons">
    <el-button @click="addOrder">购买</el-button>
    <el-button @click="orderDialogIsShow=false">取消</el-button>
  </div>
</template>

<style scoped>
.buttons {
  display: flex;
  justify-content: center;
}
</style>