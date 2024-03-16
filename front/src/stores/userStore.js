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
            return "登录成功"
        } else {
            return res.message
        }
    }


    const logout = () => {
        customer.value = null
        jwtToken.value = null
    }
    return {customer, jwtToken, isLogin, login, logout}
})