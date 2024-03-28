import axios from "axios";
import {ElMessage} from "element-plus";
const getResponseFromAxios=(response)=>{
    response=response.data
    if(response.code!==200){
        ElMessage.error(response.message)
    }
    return {code:response.code,data:response.data,message:response.message}
}
export const loginRequest=async (data) => {
    const response = await axios.post(`/api/customer/login`, data)
    return getResponseFromAxios(response)
}
export const categoryListRequest=async ()=>{
    const response=await axios.get(`/api/product/categoryList`)
    return getResponseFromAxios(response)
}
export const productListRequest=async (params)=>{
    const response=await axios.get(`/api/product/productList`,{
        params
    })
    return getResponseFromAxios(response)
}
export const productInfoRequest=async (params)=>{
    const response=await axios.get(`/api/product/productInfo`,{
        params
    })
    return getResponseFromAxios(response)
}
export const addNormalProduct=async (form,imageList)=>{
    var formData = new FormData();
    imageList.value.forEach(x=>formData.append("imageList",x.raw))
    formData.append("productInfo",JSON.stringify(form))
    const response = await axios.post(`/api/product/add`, formData)
    return getResponseFromAxios(response)
}