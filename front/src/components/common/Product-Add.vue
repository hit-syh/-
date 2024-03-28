<script setup>
import {computed, reactive, ref, watch} from "vue";
import {useProductCategoryStore} from "@/stores/productCategoryStore.js";
import {useCustomerStore} from "@/stores/userStore.js";
import {Plus} from "@element-plus/icons-vue";
import {addNormalProduct} from "@/js/request.js";
import {ElMessage} from "element-plus";

const categoryStore = useProductCategoryStore()
const customerStore = useCustomerStore();
const productDialogIsShow=defineModel()
const productForm = reactive({
  productTitle: null,
  productName: null,
  sellerId: customerStore.customer.customerId,
  descript: null,
  stock: 0,
  price: 0,
  categoryId: null,
  isSpikes: false,
  spikesTime: null,
  imageListLen:0
})
const imageList=ref([])
watch(imageList,(newValue)=>{
  productForm.imageListLen=newValue.length
})
const submitProduct=async () => {
  formRef.value.validate(async (valid) => {
    if (valid) {
      if (productForm.isSpikes) {
      } else {
        let ans = await addNormalProduct(productForm, imageList)
        if (ans.code === 200) {
          productDialogIsShow.value = false
          ElMessage.info("发售成功")
        }
      }
    }
  })
}
const formRef=ref(null)
const normalRules = reactive({
  categoryId: [{ required: true, message: '请选择分类', trigger: 'change' }],
  productTitle: [{ required: true, message: '请输入产品标题', trigger: 'blur' }],
  productName: [{ required: true, message: '请输入产品名称', trigger: 'blur' }],
  descript: [{ required: true, message: '请输入产品描述', trigger: 'blur' }],
  stock: [
    { type:"number", min: 1, message: '库存数量不能小于1', trigger: 'blur' },
  ],
  price: [
    { type:"number",min: 0, message: '价格不能小于0', trigger: 'blur' },
  ],
  imageListLen: [
    { type:"number",message: '请上传至少一张图片', trigger: 'blur' ,min:1},
  ],
});

</script>

<template>
  <el-form :rules="normalRules" ref="formRef" :model="productForm">
    <el-form-item label="图片" prop="imageListLen">
      <el-upload :auto-upload="false"
                 v-model:file-list="imageList"
                 list-type="picture-card"
      >
        <el-icon>
          <Plus/>
        </el-icon>
      </el-upload>
    </el-form-item>
    <el-form-item label="是否设置为秒杀商品">
      <el-radio-group v-model="productForm.isSpikes">
        <el-radio-button :value="true">是</el-radio-button>
        <el-radio-button :value="false">否</el-radio-button>
      </el-radio-group>
    </el-form-item>
    <el-form-item label="秒杀时间" v-if="productForm.isSpikes">
      <el-date-picker v-model="productForm.spikesTime"
                      type="datetime"
                      placeholder="选择时间"
                      format="YYYY-MM-DD HH:mm:ss"
                      date-format="MMM DD, YYYY"
                      time-format="HH:mm:ss">
      </el-date-picker>
    </el-form-item>
    <el-form-item label="类别" prop="categoryId">
      <el-select v-model="productForm.categoryId">
        <el-option v-for="category in categoryStore.categoryList" :key="category.categoryId"
                   :label="category.categoryName" :value="category.categoryId"></el-option>
      </el-select>
    </el-form-item>
    <el-form-item label="标题" prop="productTitle">
      <el-input v-model="productForm.productTitle"></el-input>
    </el-form-item>
    <el-form-item label="名称" prop="productName">
      <el-input v-model="productForm.productName"></el-input>
    </el-form-item>
    <el-form-item label="描述" prop="descript">
      <el-input v-model="productForm.descript"></el-input>
    </el-form-item>
    <el-form-item label="价格" prop="price">
      <el-input-number v-model="productForm.price"></el-input-number>
    </el-form-item>
    <el-form-item label="库存" prop="stock">
      <el-input-number v-model="productForm.stock"></el-input-number>
    </el-form-item>
    <div class="buttons">
      <el-button @click="submitProduct">确定</el-button>
      <el-button @click="productDialogIsShow=false">取消</el-button>
    </div>
  </el-form>
</template>

<style scoped>
.buttons {
  display: flex;
  justify-content: center;
}
</style>