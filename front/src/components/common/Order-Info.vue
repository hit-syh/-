<script setup>
import {getOrderRequest} from "@/js/request.js";
import {ref} from "vue";

const props=defineProps(["orderId"])
const orderId=props.orderId;
const orderInfo=ref(null)
getOrderRequest(orderId).then((code,data,message)=>{
  orderInfo.value=data;
})
</script>

<template>
<div class="container">

</div>
</template>

<style scoped>
.container{
  height: 100%;
  width: 100%;
}
</style>