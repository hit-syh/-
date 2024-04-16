import './assets/main.css'

import { createApp } from 'vue'
import App from './App.vue'
import Route from './router/index.js'
import ElementPlus, {ElMessage} from 'element-plus'
import 'element-plus/dist/index.css'
import { createPinia } from 'pinia'
import axios from "axios";
import {useCustomerStore} from "@/stores/userStore.js";

createApp(App)
    .use(Route)
    .use(ElementPlus)
    .use(createPinia())
    .mount('#app')
useCustomerStore().continueLogin()
axios.interceptors.request.use((config)=>{
    if (sessionStorage.getItem("token")) {
        config.headers['Authorization'] = sessionStorage.getItem("token");
    }
    return config
})
axios.interceptors.response.use((response) => {
    response=response.data
    if(response.code!==200){
        ElMessage.error(response.message)
    }
    return {code:response.code,data:response.data,message:response.message}
})