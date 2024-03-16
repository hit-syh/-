<script setup>
import {reactive} from "vue";
import {useCustomerStore} from "@/stores/userStore.js";

const loginDialogIsShow = defineModel()
const loginData = reactive({
  mail: "",
  password: ""
})
const customerStore = useCustomerStore()
const login = () => {
  customerStore.login(loginData).then((message) => {
    if (customerStore.isLogin) {
      loginDialogIsShow.value = false
    }
  })
}
</script>

<template>
  <el-form v-model="loginData">
    <el-form-item label="账号">
      <el-input v-model="loginData.mail"></el-input>
    </el-form-item>
    <el-form-item label="密码">
      <el-input type="password" v-model="loginData.password"></el-input>
    </el-form-item>
  </el-form>
  <div class="buttons">
    <el-button @click="login">登录</el-button>
    <el-button @click="loginDialogIsShow=false">取消</el-button>
  </div>

</template>

<style scoped>
.buttons {
  display: flex;
  justify-content: center;
}
</style>