import axios from "axios";
export const loginRequest=async (data) => {
    return await axios.post(`/api/customer/login`, data)
}
export const categoryListRequest=async ()=>{
    return await axios.get(`/api/product/categoryList`)
}
export const productListRequest=async (params)=>{
    return await axios.get(`/api/product/productList`,{
        params
    })
}
export const productInfoRequest=async (params)=>{
    return await axios.get(`/api/product/productInfo`,{
        params
    })
}
export const addNormalProduct=async (form,imageList)=>{
    const formData = new FormData();
    imageList.value.forEach(x=>formData.append("imageList",x.raw))
    formData.append("productInfo",JSON.stringify(form))
    return  await axios.post(`/api/product/add`, formData)
}
export const addOrderRequest=async (form)=>{
    return await axios.post(`/api/order/addOrder`, form)
}
export const getOrderRequest=async (id)=>{
    return await axios.get(`/api/order/${id}`)
}