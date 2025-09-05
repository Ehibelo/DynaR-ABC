<script setup>
import { ref } from 'vue'
import { useCounterStore } from '@/stores'
import { userRegisterService } from '@/api/user'
import { userLoginService } from '@/api/user'
import { ElMessage } from 'element-plus'
import { onMounted } from 'vue'
const data = ref()
const sex = ref()
const nickname = ref()
const introduction = ref()
const year = ref()
const month = ref()
const dath = ref()
const province = ref()
const city = ref()
const labelPosition = ref('left')
const store = useCounterStore()
const getdata = async () => {
  const response = await userLoginService()
  data.value = response.data // 正确的使用方式
  // 更新 store 和其他 ref
  store.setinfo(
    data.value.nickname,
    data.value.short,
    data.value.sex,
    data.value.year,
    data.value.month,
    data.value.date,
    data.value.province,
    data.value.city,
    data.value.introduction
  )
}
onMounted(async () => {
  await getdata() // 等待 getdata 完成
  sex.value = data.value.sex
  nickname.value = data.value.nickname
  introduction.value = data.value.introduction
  year.value = data.value.year
  month.value = data.value.month
  dath.value = data.value.date // 注意这里应该是 date 而不是 dath
  province.value = data.value.province
  city.value = data.value.city
})
const provinceoptions = [
  {
    value: '内蒙古自治区',
    label: '内蒙古自治区'
  }
]
const cityoptions = [
  {
    value: '呼和浩特市',
    label: '呼和浩特市'
  }
]
const yearoptions = [
  {
    year: '1990',
    label: '1900'
  }
]
const monthoptions = [
  {
    value: '1',
    label: '1'
  }
]
const dayoptions = [
  {
    value: '01',
    label: '01'
  }
]
const isTouching = ref(false) // 新增响应式数据，用于跟踪是否触摸头像

const handleTouchStart = () => {
  isTouching.value = true // 当触摸开始时，设置isTouching为true
}

const handleTouchEnd = () => {
  isTouching.value = false // 当触摸结束时，设置isTouching为false
}

const saveInfo = async (event) => {
  try {
    // 调用服务并等待结果
    const response = await userRegisterService({
      nickname: nickname.value,
      introduction: introduction.value,
      sex: sex.value,
      year: parseInt(year.value, 10),
      month: parseInt(month.value, 10),
      date: parseInt(dath.value, 10),
      province: province.value,
      city: city.value
    })
    ElMessage({
      message: response.message || '保存成功',
      type: 'success',
      duration: 2000
    })
  } catch (error) {
    // 如果服务调用失败，则处理错误
    // 确保只在服务调用失败时显示错误消息
    if (error.response) {
      ElMessage({
        message: error.response.data.message || '保存失败',
        type: 'error',
        duration: 2000
      })
    } else {
      // 如果没有 error.response，可能是因为网络问题或请求未发出
      ElMessage({
        message: error.message || '请求失败',
        type: 'error',
        duration: 2000
      })
    }
  }
}
</script>

<template>
  <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet" />
  <html class="dark">
    <h1 style="margin-top: 20px">编辑个人信息</h1>
    <div class="container">
      <el-form :label-position="labelPosition">
        <el-form-item label="昵称:  " class="form-item">
          <div class="nickname-intro-container">
            <el-input v-model="nickname" class="nickname-input" style="width: 500px"></el-input>
          </div>
        </el-form-item>
        <el-form-item label="简介:  " class="form-item">
          <el-input
            type="textarea"
            :rows="7"
            show-word-limit
            maxlength="300"
            v-model="introduction"
            style="width: 500px"
          ></el-input>
        </el-form-item>
        <el-form-item label="性别:  " class="form-item">
          <el-radio-group v-model="sex">
            <el-radio value="man">男</el-radio>
            <el-radio value="woman">女</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="生日:  " class="form-item">
          <el-select
            v-model="year"
            placeholder="Select"
            style="width: 160px; margin-right: 10px"
            :empty-values="[null, undefined]"
          >
            <el-option
              v-for="item in yearoptions"
              :key="item.year"
              :label="item.label"
              :value="item.year"
            />
          </el-select>
          <el-select
            v-model="month"
            placeholder="Select"
            style="width: 160px; margin-right: 10px"
            :empty-values="[null, undefined]"
          >
            <el-option
              v-for="item in monthoptions"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            />
          </el-select>
          <el-select
            v-model="dath"
            placeholder="Select"
            style="width: 160px"
            :empty-values="[null, undefined]"
          >
            <el-option
              v-for="item in dayoptions"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="地区:  " class="form-item">
          <el-select
            v-model="province"
            placeholder="Select"
            style="width: 160px; margin-right: 10px"
            :empty-values="[null, undefined]"
          >
            <el-option
              v-for="item in provinceoptions"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            />
          </el-select>
          <el-select
            v-model="city"
            placeholder="Select"
            style="width: 160px; margin-right: 10px"
            :empty-values="[null, undefined]"
          >
            <el-option
              v-for="item in cityoptions"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            />
          </el-select>
        </el-form-item>
        <div
          class="button-container"
          style="display: flex; justify-content: flex-start; margin-top: 20px"
        >
          <button class="button save-button" @click="saveInfo($event)">保存</button>
          <button class="button cancel-button" @click="cancelEdit">取消</button>
        </div>
      </el-form>
      <div
        class="avatar"
        @touchstart="handleTouchStart"
        @touchend="handleTouchEnd"
        :class="{ touch: isTouching }"
      >
        <img src="@/assets/baoan.jpg" alt="Avatar" />
      </div>
    </div>
  </html>
</template>

<style scoped>
body {
  font-family: 'Pacifico', cursive;
  background: linear-gradient(to bottom, #0f0f0f, #412c2c, #d63636); /* 从灰色到黑色的渐变 */
  color: white;
  margin: 0;
  padding: 20px;
}
h1 {
  font-size: 30px;
  color: #fff; /* 设置标题颜色 */
}
.container {
  width: 800px;
  margin-top: 40px;
  margin-left: 40px;
  display: flex; /* 使用Flex布局 */
  justify-content: space-between; /* 在Flex项目之间添加间隔 */
  align-items: flex-start; /* 垂直对齐为顶部对齐 */
}
.form {
  flex-grow: 1; /* 表单部分可以增长以填充可用空间 */
  max-width: 550px; /* 限制表单的最大宽度 */
}
.form-item {
  margin-top: 20px; /* 添加表单项之间的间距 */
}
.button-container {
  display: flex;
  gap: 20px; /* 按钮之间的间隔 */
}

.button {
  display: inline-block;
  padding: 10px 20px;
  border: none;
  border-radius: 25px;
  color: #fff; /* 文字颜色 */
  font-size: 20px;
  cursor: pointer;
  width: 130px;
  height: 50px;
  transition: background-color 0.3s ease; /* 平滑过渡效果 */
}

.save-button {
  background-color: rgb(238, 67, 67); /* 保存按钮背景色 */
}

.cancel-button {
  background-color: transparent; /* 取消按钮背景色 */
  border: 2px solid #fff; /* 取消按钮边框 */
}

.button:hover {
  opacity: 0.8; /* 鼠标悬停时的透明度 */
}

.button-container {
  gap: 50px; /* 按钮之间的间隔 */
  justify-content: flex-start; /* 使按钮左对齐 */
  margin-left: 230px;
  padding-top: 100px;
}
.avatar {
  position: absolute;
  right: 100px;
  margin-top: 20px;
  width: 200px;
  text-align: right;
  cursor: pointer; /* 当鼠标悬停在头像上时显示小手光标 */
  transition: filter 0.3s ease; /* 平滑过渡效果 */
}
.avatar img {
  height: 150px;
  width: 150px;
  border-radius: 50%; /* 产生圆形效果 */
  transition: filter 0.3s ease; /* 平滑过渡效果 */
}
/* 当鼠标悬停或触摸头像时应用以下样式 */
.avatar:hover img,
.avatar.touch img {
  filter: brightness(0.5); /* 将图片变暗 */
}
</style>
