<script setup>
import { ref, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { useCounterStore } from '@/stores'
import {
  ArrowLeft,
  Search,
  ArrowDown,
  Goods,
  TakeawayBox,
  Tools,
  Sunrise,
  Moon,
  Minus,
  FullScreen,
  Close
} from '@element-plus/icons-vue'

const store = useCounterStore()
const info = ref(store.info)
const router = useRouter()

// 直接设置为true作为默认值
const isDarkMode = ref(true)

// 应用深色主题的函数
const applyDarkTheme = () => {
  document.documentElement.style.setProperty('--color-background', '#181818')
  document.documentElement.style.setProperty('--color-background-soft', '#222222')
  document.documentElement.style.setProperty('--color-background-mute', '#282828')
  document.documentElement.style.setProperty('--color-border', 'rgba(84, 84, 84, 0.48)')
  document.documentElement.style.setProperty('--color-border-hover', 'rgba(84, 84, 84, 0.65)')
  document.documentElement.style.setProperty('--color-heading', 'rgba(235, 235, 235, 0.87)')
  document.documentElement.style.setProperty('--color-text', 'rgba(235, 235, 235, 0.6)')
}

// 应用浅色主题的函数
const applyLightTheme = () => {
  document.documentElement.style.setProperty('--color-background', '#ffffff')
  document.documentElement.style.setProperty('--color-background-soft', '#f8f8f8')
  document.documentElement.style.setProperty('--color-background-mute', '#f2f2f2')
  document.documentElement.style.setProperty('--color-border', 'rgba(60, 60, 60, 0.12)')
  document.documentElement.style.setProperty('--color-border-hover', 'rgba(60, 60, 60, 0.29)')
  document.documentElement.style.setProperty('--color-heading', 'rgba(44, 62, 80, 0.87)')
  document.documentElement.style.setProperty('--color-text', 'rgba(44, 62, 80, 0.6)')
}

// 在组件挂载时应用深色主题
onMounted(() => {
  applyDarkTheme()
})

// 切换主题
const toggleDarkMode = () => {
  isDarkMode.value = !isDarkMode.value
  if (isDarkMode.value) {
    applyDarkTheme()
  } else {
    applyLightTheme()
  }
}
const returnback = () => {
  router.go(-1)
}
const getlogin = () => {
  router.push('/login')
}
const minimize = () => {
  window.electronAPI.minimize()
}
const maximize = () => {
  window.electronAPI.maximize()
}
const close = () => {
  window.electronAPI.close()
}
const getsettings = () => {
  router.push('/settings')
}
</script>

<template>
  <div class="title-bar" @dblclick="maximize">
    <div class="title-bar-left">
      <!-- 搜索部分 -->
      <div class="user-info">
        <button class="return-btn" @click="returnback">
          <el-icon><ArrowLeft /></el-icon>
        </button>
        <div class="search-container">
          <input
            type="text"
            placeholder="Search..."
            class="search-input"
            @keyup.enter="handleSearch"
          />
          <button class="search-btn" @click="handleSearch">
            <el-icon><Search /></el-icon>
          </button>
        </div>
      </div>
    </div>
    <div class="title-bar-right">
      <div class="user">
        <img src="@/assets/baoan.jpg" class="useravatr" />
        <el-dropdown>
          <span class="el-dropdown-link">
            <span class="username">{{ info.nickname }}</span>
            <el-icon class="title-bar-btn"><arrow-down /></el-icon>
          </span>
          <template #dropdown>
            <el-dropdown-menu>
              <el-dropdown-item @click="getlogin()">修改用户信息</el-dropdown-item>
              <el-dropdown-item>我的客服</el-dropdown-item>
              <el-dropdown-item>退出登录</el-dropdown-item>
            </el-dropdown-menu>
          </template>
        </el-dropdown>
      </div>
      <button class="title-bar-btn" style="margin-top: 2px">
        <el-icon><Goods /></el-icon>
        <!-- 使用 Element Plus 的图标 -->
      </button>
      <button class="title-bar-btn" style="margin-top: 2px">
        <el-icon><TakeawayBox /></el-icon>
        <!-- 使用 Element Plus 的图标 -->
      </button>
      <button class="title-bar-btn" style="margin-top: 2px" @click="getsettings()">
        <el-icon><Tools /></el-icon>
        <!-- 使用 Element Plus 的图标 -->
      </button>
      <span class="spom">|</span>
      <el-button id="toggleDarkMode" class="toggle-button title-bar-btn" @click="toggleDarkMode">
        <el-icon>
          <Sunrise v-if="isDarkMode" />
          <Moon v-else />
        </el-icon>
      </el-button>
      <button class="title-bar-btn" @click="minimize">
        <el-icon><Minus /></el-icon>
        <!-- 使用 Element Plus 的图标 -->
      </button>
      <button class="title-bar-btn" @click="maximize">
        <el-icon><FullScreen /></el-icon>
        <!-- 使用 Element Plus 的图标 -->
      </button>
      <button class="title-bar-btn" @click="close">
        <el-icon><Close /></el-icon>
        <!-- 使用 Element Plus 的图标 -->
      </button>
    </div>
  </div>
</template>

<style scoped>
.title-bar {
  -webkit-app-region: drag;
  display: flex;
  justify-content: space-between;
  align-items: center;
  height: 40px;
  width: 100%;
  background-color: var(--color-background); /* 使用 CSS 变量 */
  color: var(--color-text); /* 使用 CSS 变量 */
  padding: 8px;
  user-select: none;
  padding-top: 40px;
}
.title-bar-left,
.title-bar-right {
  display: flex;
  align-items: center;
}

.title-bar-left {
  display: flex;
  align-items: center;
  /* 确保左侧内容区域可以增长 */
  flex-grow: 1;
}

.title-bar-right {
  /* 给右侧按钮部分设置一个最小宽度 */
  min-width: 100px; /* 可以根据需要调整 */
  margin-top: 2px;
}

/* ... 其他样式保持不变 ... */

@media (min-width: 600px) {
  .title-bar-left {
    margin-right: 20px; /* 增加右侧间距 */
  }
}
.title-bar-btn,
.search-container,
.return-btn {
  -webkit-app-region: no-drag;
}

.title-bar-btn {
  background: none;
  border: none;
  cursor: pointer;
  outline: none;
  margin-left: 4px;
  width: 30px;
  height: 40px;
}

.title-bar-btn .el-icon {
  font-size: 20px;
  color: #a39999; /* 浅灰色图标 */
}

/* macOS 特有的样式 */
.title-bar.mac-style {
  background-color: rgba(0, 0, 0, 0.85);
  padding-left: 77px;
}

/* Windows 特有的样式 */
.title-bar.windows-style {
  background-color: #2f3241; /* Windows 10+ 标题栏颜色 */
  color: black;
}

.spom {
  color: #e6e5e5af;
  margin-bottom: 2px;
}

.user {
  display: flex; /* 使用flex布局 */
  align-items: center; /* 确保.user内部的元素垂直居中 */
  margin-right: 8px; /* 添加右边距以分隔.user和其他按钮 */
  cursor: pointer; /* 鼠标悬停时显示小手光标 */
}

.useravatr {
  width: 24px; /* 设置图片宽度 */
  height: 24px; /* 设置图片高度 */
  border-radius: 50%; /* 圆形头像 */
  margin-right: 8px; /* 添加右边距以分隔图片和文本 */
  cursor: pointer; /* 鼠标悬停时显示小手光标 */
}

.username {
  font-size: 14px; /* 设置用户名字体大小 */
  color: var(--color-text); /* 使用CSS变量设置文本颜色 */
  transition: color 0.3s; /* 平滑的颜色过渡效果 */
  margin-bottom: 2px;
}
.username:hover {
  color: #d3d3d3; /* 鼠标悬停时的浅灰色 */
}
.user-info {
  display: flex;
  align-items: center;
  margin-right: 60px;
  margin-top: 4px;
}
.search-container {
  display: flex;
  align-items: center;
  background: linear-gradient(to right, rgba(70, 41, 41, 0.877), rgba(51, 22, 22, 0.8));
  border-radius: 20px;
  padding: 4px 8px;
  /* 添加以下属性来使搜索栏增长 */
  flex-grow: 1; /* 使搜索容器可以增长以占据可用空间 */
}

.search-input {
  flex-grow: 1; /* 使输入框可以增长以填满搜索容器 */
  border: none;
  background: none;
  padding: 8px;
  margin-right: 8px;
  color: #fff;
  font-size: 14px;
  width: 300px;
}

/* 搜索输入框聚焦时的样式 */
.search-input:focus {
  outline: none;
}

/* 搜索按钮样式 */
.search-btn {
  background: none;
  border: none;
  cursor: pointer;
  outline: none;
}

/* 搜索图标样式 */
.search-btn .el-icon {
  font-size: 18px;
  color: #fff; /* 图标颜色 */
}

/* 返回按钮样式 */
.return-btn {
  background: linear-gradient(to right, rgba(70, 41, 41, 0.877), rgba(51, 22, 22, 0.8));
  border: 1px solid #444242; /* 暗色边框 */
  border-radius: 50%; /* 圆形边框 */
  cursor: pointer;
  outline: none;
  margin-right: 8px;
  width: 28px;
  height: 28px;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-left: 4px; /* 设置左侧间距 */
}

/* 返回图标样式 */
.return-btn .el-icon {
  font-size: 18px;
  color: #fff; /* 图标颜色 */
}

/* 鼠标悬停在返回按钮上时的样式 */
.return-btn:hover {
  background: linear-gradient(to right, #ba55d3, #9370db); /* 暗色渐变 */
}

/* 暗色模式下的搜索栏渐变色 */
.dark-mode .search-container {
  background: linear-gradient(to right, #555, #333); /* 暗色渐变 */
}

/* 暗色模式下的返回按钮背景色和边框 */
.dark-mode .return-btn {
  background: linear-gradient(to right, #555, #333); /* 暗色渐变 */
  border-color: #555; /* 暗色边框 */
}

/* 暗色模式下的返回按钮鼠标悬停样式 */
.dark-mode .return-btn:hover {
  background: linear-gradient(to right, #444, #222); /* 暗色渐变 */
}
@media (min-width: 600px) {
  .title-bar-btn,
  .return-btn {
    margin-left: 8px; /* 增加间距 */
  }
}
.el-dropdown-link {
  border: none; /* 移除边框 */
  outline: none; /* 移除聚焦时的轮廓线 */
}

.el-dropdown-link:focus {
  outline: none; /* 确保聚焦时没有轮廓线 */
}
</style>
