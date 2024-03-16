<script setup>
import {categoryListRequest, productListRequest} from "@/js/request.js";
import {computed, ref, watch} from "vue";
import {ArrowLeft, ArrowRight, DArrowRight} from "@element-plus/icons-vue";
import {ElMessage} from "element-plus";
import ProductOverview from "@/components/common/Product-Overview.vue";

const categoryList = ref(null)
categoryListRequest().then((data) => {
  categoryList.value = data.data
})
const categoryButtonList=ref(null)
const categoryButtonListToLeft=()=>{
  categoryButtonList.value.scrollLeft -= 100
}
const categoryButtonListToRight=()=>{
  categoryButtonList.value.scrollLeft += 100
}
const productList=ref([])
const pageDefaultInfo={"size":10,"current":0,categoryId:null,pages:1000}
let pageInfo={...pageDefaultInfo}
const loadMore=()=>{
  productListRequest(pageInfo).then(({code,data,message})=>{
    pageInfo.current=data.current
    pageInfo.pages=data.pages
    productList.value.push(...data.records)
  })
}
loadMore()
const categoryChange=(categoryId)=>{
  productList.value=[]
  if(pageInfo.categoryId===categoryId){
    pageInfo={...pageDefaultInfo}
  }
  else{
    pageInfo={...pageDefaultInfo}
    pageInfo.categoryId=categoryId
  }
  loadMore()
}
const lookMore=()=>{
  if(pageInfo.current<pageInfo.pages){
    pageInfo.current++
    loadMore()
  }else{
    ElMessage.info("到底啦")
  }
}
</script>

<template>
  <div class="container">
    <div class="menu">
      <button class="scroll" @click="categoryButtonListToLeft"><el-icon><ArrowLeft /></el-icon></button>
      <div class="categoryButtonList" ref="categoryButtonList">
        <div v-for="(category,key) in categoryList" :key="category.categoryId">
          <button class="categoryButton" :class="category.categoryId===pageInfo.categoryId ? 'checkedButton' :''" @click="categoryChange(category.categoryId)">{{ category.categoryName }}</button>
        </div>
      </div>
      <button class="scroll" @click="categoryButtonListToRight"><el-icon><ArrowRight /></el-icon></button>
    </div>
    <div v-infinite-scroll="lookMore" class="productList">
      <div v-for="(product,key) in productList" :key="key" class="product">
        <ProductOverview :product="product"></ProductOverview>
      </div>
    </div>


  </div>
</template>

<style scoped>
.container {
  padding: 1rem 5rem;
}

.menu {
  display: flex;
  gap: 1rem;
  justify-content: center;

}
.categoryButtonList{
  display: flex;
  overflow-x: hidden;
  gap: 1rem;

}
.scroll{
  border-radius: 1rem;
  border: 1px solid silver;

}
.categoryButton {
  -webkit-box-shadow: 0 4px 10px 0 rgba(0, 0, 0, .1);
  box-shadow: 0 4px 10px 0 rgba(0, 0, 0, .1);
  color: gray;
  border: 1px solid silver;
  padding: 1rem;
  border-radius: 1rem; /* 圆角半径 */
  white-space: nowrap;
}
.checkedButton{
  color: orangered;
}
.productList{
  display: flex;
  flex-wrap: wrap;
}
.product{
  width: 20%;
  height: 30%;
}
</style>