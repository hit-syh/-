import {defineStore} from "pinia";
import {ref} from "vue";
import {categoryListRequest} from "@/js/request.js";

export const useProductCategoryStore=defineStore("productCategory",()=>{
    const categoryList=ref(null);
    const setCategoryList=(list)=>{
        categoryList.value=list;
    }
    const getCategoryList=()=>{
        categoryListRequest().then((data) => {
            categoryList.value = data.data
        })
    }
    getCategoryList()
    return {categoryList}
})
