import './assets/main.css'

import { createApp } from 'vue'
import App from './App.vue'
import Route from './router/index.js'
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import { createPinia } from 'pinia'

createApp(App)
    .use(Route)
    .use(ElementPlus)
    .use(createPinia())
    .mount('#app')
