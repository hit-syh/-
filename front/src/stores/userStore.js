import {defineStore} from "pinia";
import {computed, ref} from "vue";
import {loginRequest} from "@/js/request.js";

export const useCustomerStore = defineStore('curUser', () => {
    const customer = ref(null);
    const jwtToken = ref(null)
    const isLogin = computed(() => {
        return customer.value !== null
    })
    const login = async (loginForm) => {
        let res = await loginRequest(loginForm)

        if (res.code === 200) {
            customer.value = res.data.customer
            jwtToken.value = res.data.token
            sessionStorage.setItem("token", res.data.token)
            sessionStorage.setItem("customer", JSON.stringify(res.data.customer))
            return "登录成功"
        } else {
            return res.message
        }
    }
    const continueLogin=()=>{
        if(sessionStorage.getItem("customer")!=null && sessionStorage.getItem("token")!=null){
            customer.value=JSON.parse(sessionStorage.getItem("customer"))
            jwtToken.value=sessionStorage.getItem("token")
        }
    }


    const logout = () => {
        customer.value = null
        jwtToken.value = null
        sessionStorage.removeItem("token")
        sessionStorage.removeItem("customer")
    }
    return {customer, jwtToken, isLogin, login, logout ,continueLogin}
})