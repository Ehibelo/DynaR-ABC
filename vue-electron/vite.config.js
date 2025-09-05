import { fileURLToPath, URL } from 'node:url'

import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vitejs.dev/config/
export default defineConfig({
  base: './',
  plugins: [vue()],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    }
  }
  // server: {
  // host: '0.0.0.0', // 监听所有 IPv4 地址
  // port: 5173, // 你可以指定一个端口号，或者使用默认端口
  // strictPort: true // 如果端口已被占用，则退出
  // }
})
