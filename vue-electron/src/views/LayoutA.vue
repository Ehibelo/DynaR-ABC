<script setup>
import { RouterLink, RouterView } from 'vue-router'
import Header from '@/views/HeadA.vue'
import Aside from './AsideA.vue'
import { userLoginService } from '@/api/user'
import { useCounterStore } from '@/stores'
const store = useCounterStore()

const getdata = async () => {
  const data = await userLoginService()
  store.setinfo(
    data.data.nickname,
    data.data.short,
    data.data.sex,
    data.data.year,
    data.data.month,
    data.data.date,
    data.data.province,
    data.data.city,
    data.data.introduction
  )
}
getdata()
</script>

<template>
  <div class="common-layout">
    <el-container>
      <el-aside width="200px"><Aside></Aside></el-aside>
      <el-container>
        <el-header>
          <Header></Header>
        </el-header>
        <el-main>
          <RouterView></RouterView>
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<style scoped>
/* 添加深色模式变量定义 */
:root {
  /* 深色模式变量 */
  --vt-c-black: #181818;
  --vt-c-black-soft: #222222;
  --vt-c-black-mute: #282828;

  --vt-c-divider-dark-1: rgba(84, 84, 84, 0.65);
  --vt-c-divider-dark-2: rgba(84, 84, 84, 0.48);

  --vt-c-text-dark-1: rgba(235, 235, 235, 0.87);
  --vt-c-text-dark-2: rgba(235, 235, 235, 0.6);

  /* 浅色模式变量 */
  --vt-c-white: #ffffff;
  --vt-c-white-soft: #f8f8f8;
  --vt-c-white-mute: #f2f2f2;

  --vt-c-divider-light-1: rgba(60, 60, 60, 0.29);
  --vt-c-divider-light-2: rgba(60, 60, 60, 0.12);

  --vt-c-text-light-1: rgba(44, 62, 80, 0.87);
  --vt-c-text-light-2: rgba(44, 62, 80, 0.6);
}

/* 原有样式保持不变 */
.common-layout {
  background-color: var(--color-background);
  color: var(--color-text);
  min-height: 100vh;
}

/* 删除冲突的背景渐变 */
/* body {
  background-color: linear-gradient(to bottom, #333030, #724646, #d63636);
} */
</style>
