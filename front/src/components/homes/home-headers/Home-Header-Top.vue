<script setup>
import {reactive, ref} from "vue";
import LoginForm from "@/components/common/Login-Form.vue";
const loginDialogIsShow = ref(false)
import {useCustomerStore} from "@/stores/userStore.js";
const customerStore=useCustomerStore()

</script>

<template>
    <div class="left">
      <p class="logo">**商城</p>
    </div>
    <div class="right">
      <label v-if="customerStore.isLogin">{{customerStore.customer.loginName}}</label>
    <el-button class="button" v-if="!customerStore.isLogin" round color="blue" @click="loginDialogIsShow=true">登录</el-button>
    <el-button class="button" v-else round color="red"  @click="customerStore.logout">退出</el-button>
    </div>
    <el-dialog v-model="loginDialogIsShow" width="500px" :show-close="false">
      <LoginForm v-model="loginDialogIsShow"></LoginForm>
    </el-dialog>
</template>

<style scoped>
.logo {
  font-family: "Arial", sans-serif;
  font-size: 2rem;
  color: orangered; /* 文字颜色为粉色 */
  text-shadow: 2px 2px 4px #0000ff; /* 添加文字阴影效果 */
  animation: pulse 1s infinite; /* 添加动画效果 */
}
.right{
  display: flex;
  gap: 2rem;
}
label{
  font-size: 1rem;
  font-weight: bolder;
}
@keyframes pulse {
  0% {
    transform: scale(1);
  }
  50% {
    transform: scale(1.2);
  }
  100% {
    transform: scale(1);
  }
}
</style>