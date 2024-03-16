import {createRouter, createWebHistory} from "vue-router";
import Home from "@/views/Home.vue"
import PersonalCenter from "@/views/Personal-Center.vue";
import HomeBodyNormalProduct from "@/components/homes/home-bodys/Home-Body-Normal-Product.vue";
import HomeBodySpkiesProduct from "@/components/homes/home-bodys/Home-Body-Spkies-Product.vue";
import ProductInfo from "@/views/Product-Info.vue";

const routes = [
    {
        path: "/home", component: Home, children: [
            {path: "normal-product", component: HomeBodyNormalProduct},
            {path: "spikes-product", component: HomeBodySpkiesProduct},
            {path: "", redirect: "/home/normal-product"}
        ]
    },
    {path: "/person-center", component: PersonalCenter},
    {path: "/product-info/:productId",component: ProductInfo},
    {path: "/:pathMatch(.*)*", redirect: "/home"}
]
const router = createRouter({history: createWebHistory(), routes})
export default router