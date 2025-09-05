<script setup>
//左侧边栏
import { useRouter } from 'vue-router'
import {
  HomeFilled,
  Setting,
  Avatar,
  HelpFilled,
  Finished,
  Histogram,
  PieChart,
  PriceTag,
  AddLocation,
  Odometer
} from '@element-plus/icons-vue'
const router = useRouter()
</script>

<template>
  <div class="sidebar">
    <div class="logo" style="-webkit-app-region: drag">
      <img src="@/assets/logo1.jpg" alt="Logo" class="logo-icon" />
      <span class="logo-text">AGSTCT</span>
    </div>
    <nav>
      <ul class="nav-list">
        <!-- 分隔线 -->
        <li>
          <hr class="separator" />
        </li>
        <li>
          <RouterLink to="/Home" active-class="active">
            <el-icon class="icon-size"><HomeFilled /></el-icon>
            <span :class="{ active: $route.path === '/Home' }">Home</span>
          </RouterLink>
        </li>
        <!-- ///////////////////////////////////////////////////////////////////////////////////// -->
        <li>
          <hr class="separator" />
        </li>
        <li class="user-item">
          <span class="user">Tset Suite</span>
        </li>
        <!-- Cal -->
        <li>
          <RouterLink to="/manange" active-class="active">
            <el-icon class="icon-size"><Finished /></el-icon>
            <span :class="{ active: $route.path === '/manange' }">Calculations</span>
          </RouterLink>
        </li>
        <!-- SG -->
        <li>
          <RouterLink to="/statis" active-class="active">
            <el-icon class="icon-size"><Histogram /></el-icon>
            <span :class="{ active: $route.path === '/statis' }">Statistics Generator</span>
          </RouterLink>
        </li>
        <!-- CG -->
        <li>
          <RouterLink to="/charts" active-class="active">
            <el-icon class="icon-size"><PieChart /></el-icon>
            <span :class="{ active: $route.path === '/charts' }">Charts Generator</span>
          </RouterLink>
        </li>
        <!-- ///////////////////////////////////////////////////////////////////////////////////// -->
        <li>
          <hr class="separator" />
        </li>
        <li class="user-item">
          <span class="user">Application</span>
        </li>
        <!-- WT -->
        <li>
          <RouterLink to="/web" active-class="active">
            <el-icon class="icon-size"><PriceTag /></el-icon>
            <span :class="{ active: $route.path === '/web' }">Webapi Testation</span>
          </RouterLink>
        </li>
        <!-- DNNP -->
        <li>
          <RouterLink to="/picture" active-class="active">
            <el-icon class="icon-size"><AddLocation /></el-icon>
            <span :class="{ active: $route.path === '/picture' }">DNN Picture</span>
          </RouterLink>
        </li>
        <!-- MODEL -->
        <li>
          <RouterLink to="/model" active-class="active">
            <el-icon class="icon-size"><ChatRound /></el-icon>
            <span :class="{ active: $route.path === '/model' }">Model</span>
          </RouterLink>
        </li>
        <!-- SAFETY -->
        <li>
          <RouterLink to="/safety" active-class="active">
            <el-icon class="icon-size"><Odometer /></el-icon>
            <span :class="{ active: $route.path === '/safety' }">Safety</span>
          </RouterLink>
        </li>
        <!-- ///////////////////////////////////////////////////////////////////////////////////// -->
        <li>
          <hr class="separator" />
        </li>
        <!-- 我的 -->
        <li class="user-item">
          <span class="user">User</span>
        </li>
        <!-- 用户信息 -->
        <li>
          <RouterLink to="/login" active-class="active">
            <el-icon class="icon-size"><Avatar /></el-icon>
            <span :class="{ active: $route.path === '/login' }">Userinfo</span>
          </RouterLink>
        </li>
        <!-- Setting -->
        <!-- Help -->
        <li>
          <RouterLink to="/help" active-class="active">
            <el-icon class="icon-size"><HelpFilled /></el-icon>
            <span :class="{ active: $route.path === '/help' }">Help</span>
          </RouterLink>
        </li>
      </ul>
    </nav>
  </div>
  <div class="content">
    <!-- Your main content goes here -->
  </div>
</template>

<style scoped>
body,
html {
  margin: 0;
  padding: 0;
  font-family: Arial, sans-serif;
}

.sidebar {
  background: linear-gradient(to bottom, #000000, #302b2b); /* 从灰色到黑色的渐变 */
  color: white;
  height: 100vh;
  position: fixed;
  overflow: auto;
}

.logo {
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 20px;
}

.logo-icon {
  width: 40px; /* 图标宽度 */
  height: auto; /* 高度自适应 */
  margin-right: 10px; /* 图标和文字之间的间距 */
}

.logo-text {
  font-size: 24px; /* Adjust size as needed */
  font-weight: bold;
  color: rgb(219, 102, 102);
  letter-spacing: 1px; /* Optional: adds spacing between letters */
}

h1 {
  margin: 10px 0;
  font-size: 1.5em;
}

.nav-list {
  margin-top: 20px;
  list-style-type: none;
  padding: 0;
}

.nav-list li a:hover {
  background-color: #555;
}

.nav-list li a.active {
  background-color: #ffffff; /* 或者你想要的颜色 */
}
.content {
  margin-left: 250px; /* Same as sidebar width */
  padding: 20px;
}

.nav-list li a {
  display: flex;
  align-items: center;
  color: white;
  padding: 10px 20px;
  text-decoration: none;
  transition: background-color 0.3s; /* 添加过渡效果 */
}

.nav-list li a .el-icon {
  margin-right: 10px; /* 设置图标和文本之间的间距 */
}

.icon-size {
  font-size: 23px;
}

.separator {
  margin: 20px 0;
  border: 0;
  border-top: 1px solid #666; /* 分隔线颜色 */
  width: 80%; /* 设置分隔线宽度为80% */
  margin-left: auto;
  margin-right: auto; /* 使分隔线居中显示 */
}

.user-item {
  display: flex;
  align-items: center;
  color: white;
  padding: 5px 20px;
  text-decoration: none;
}

.user {
  font-size: 1em; /* 更小的字体大小 */
  font-weight: lighter; /* 文字变细 */
  margin-right: auto; /* 将“我的”文字推到左侧 */
}

.nav-list li a.active {
  background-color: transparent;
  color: #fff;
  border-left: 3px solid #409eff;
}

.nav-list li a.active .el-icon {
  color: inherit;
}
</style>
