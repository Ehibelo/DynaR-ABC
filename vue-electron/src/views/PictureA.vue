<script setup>
import { ref } from 'vue'
import PageContainer from '@/components/PageContainer.vue'
import CompareDialog from '@/components/CompareDialog.vue'
import defaultImage from '@/assets/1.png' // 默认图片路径
import { uploadImageService } from '@/api/user'
import JSZip from 'jszip'
import { saveAs } from 'file-saver'
const adjust = ref()
const imageUrl = ref(defaultImage)
const logMessages = ref([])
const dialog = ref()
const selectedFile = ref(null)
const processedImages = ref([]) // 存储处理后的图片数据
const progress1 = ref(0)
const progress2 = ref(0)
const progress3 = ref(0)

const csvContent = ref('等待中')

const onSuccess = () => {
  progress3.value = 100
  logMessages.value.push('数据比对完成！')
  console.log(csvContent.value)
}

const handleFileSelect = (event) => {
  const file = event.target.files[0]
  if (file) {
    selectedFile.value = file
    imageUrl.value = URL.createObjectURL(file)
    logMessages.value.push(`文件已选择: ${file.name}`)
  } else {
    logMessages.value.push('未选择文件')
  }
}

const handleUpload = async () => {
  if (!selectedFile.value) {
    logMessages.value.push('请先选择文件！')
    return
  }

  logMessages.value.push('文件上传中...')
  progress1.value = 30

  try {
    const response = await uploadImageService(selectedFile.value)
    processedImages.value = response.data.processedImages || []

    progress1.value = 100
    logMessages.value.push(`文件上传成功: ${selectedFile.value.name}`)
    logMessages.value.push(`生成 ${processedImages.value.length} 张处理图片`)
  } catch (error) {
    progress1.value = 0
    logMessages.value.push(`上传失败: ${error.message}`)
  }
}

const onCompare = () => {
  if (!processedImages.value?.length) {
    logMessages.value.push('没有可比对的图片！')
    return
  }

  dialog.value.open() // 移除参数传递
  logMessages.value.push('开始数据比对...')
}

// 下载所有图片为ZIP压缩包
const downloadImagesAsZip = async () => {
  if (!processedImages.value || processedImages.value.length === 0) {
    logMessages.value.push('没有可下载的图片！')
    return
  }

  logMessages.value.push('开始准备下载压缩包...')
  progress2.value = 20

  try {
    const zip = new JSZip()
    const imgFolder = zip.folder('processed_images')
    let processedCount = 0

    // 添加所有图片到ZIP
    await Promise.all(
      processedImages.value.map(async (img) => {
        try {
          // 将相对路径转换为绝对路径
          const baseUrl = 'http://localhost:3007'
          const fullUrl = `${baseUrl}${img.url}`

          // 输出图片的 URL 到日志
          logMessages.value.push(`正在处理图片: ${fullUrl}`)
          logMessages.value.push(`图片文件名: ${img.filename}`)

          const response = await fetch(fullUrl)
          if (!response.ok) {
            throw new Error(`Failed to fetch ${fullUrl}`)
          }

          const blob = await response.blob()
          logMessages.value.push(`图片 MIME 类型: ${blob.type}`)
          logMessages.value.push(`图片大小: ${blob.size} 字节`)

          // 生成一个临时链接来预览图片
          const url = URL.createObjectURL(blob)
          logMessages.value.push(`图片预览链接: ${url}`)

          imgFolder.file(img.filename, blob)

          processedCount++
          progress2.value = 20 + Math.floor((processedCount / processedImages.value.length) * 80)
          logMessages.value.push(`已添加: ${img.filename}`)
        } catch (error) {
          logMessages.value.push(`处理图片 ${img.filename} 时出错: ${error.message}`)
        }
      })
    )

    // 生成ZIP文件
    const content = await zip.generateAsync({ type: 'blob' }, (metadata) => {
      progress2.value = 20 + Math.floor(metadata.percent * 0.8)
    })

    // 下载ZIP
    saveAs(content, 'processed_images.zip')
    progress2.value = 100
    logMessages.value.push('压缩包下载完成！')
  } catch (error) {
    progress2.value = 0
    logMessages.value.push(`压缩包创建失败: ${error.message}`)
  }
}
</script>

<template>
  <PageContainer :title="'DNN模型测试'" class="page-container">
    <div class="container">
      <!-- 上半部分 -->
      <div class="top-section">
        <!-- 左上：上传文件 -->
        <div class="left-top-container">
          <h3>上传图片</h3>
          <input type="file" accept="image/*" @change="handleFileSelect" />
          <div class="left-top">
            <div v-if="imageUrl" class="image-preview">
              <h4>图片预览：</h4>
              <img :src="imageUrl" alt="Uploaded Image" class="preview-image" />
            </div>
          </div>
        </div>

        <!-- 右侧：日志输出和按钮 -->
        <div class="right-container">
          <div class="right-top">
            <div class="progress-section">
              <div class="progress-item">
                <div class="progress-header">
                  <h3 class="progress-title">图片上传</h3>
                  <el-button type="info" size="small" @click="handleUpload">
                    <el-icon class="mr-1"><Promotion /></el-icon>
                    图片上传
                  </el-button>
                </div>
                <el-progress
                  :percentage="progress1"
                  :stroke-width="16"
                  status="success"
                  class="progress-bar"
                />
              </div>
              <div class="progress-item">
                <div class="progress-header">
                  <h3 class="progress-title">图片下载</h3>
                  <el-button
                    type="info"
                    size="small"
                    @click="downloadImagesAsZip"
                    :disabled="!processedImages || processedImages.length === 0"
                  >
                    <el-icon class="mr-1"><Download /></el-icon>
                    下载压缩包
                  </el-button>
                </div>
                <el-progress
                  :percentage="progress2"
                  :stroke-width="16"
                  status="success"
                  class="progress-bar"
                />
              </div>
              <div class="progress-item">
                <div class="progress-header">
                  <h3 class="progress-title">数据比对</h3>
                  <el-button type="info" size="small" @click="onCompare" :disabled="true">
                    <el-icon class="mr-1"><Switch /></el-icon>
                    数据比对
                  </el-button>
                </div>
                <el-progress
                  :percentage="progress3"
                  :stroke-width="16"
                  status="success"
                  class="progress-bar"
                />
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- 下半部分 -->
      <div class="bottom-section">
        <!-- 日志输出 -->
        <div class="log-container">
          <h3>日志输出</h3>
          <div class="log-output">
            <ul>
              <li v-for="(log, index) in logMessages" :key="index">{{ log }}</li>
            </ul>
          </div>
        </div>

        <!-- 新增的 CSV 输出区域 -->
        <!-- <div class="csv-container">
          <h3>BEN 分析结果 (output.csv)</h3>
          <div class="csv-content">
            <pre v-if="adjust">{{ csvContent }}</pre>
            <p v-else>等待分析结果生成...</p>
          </div>
        </div> -->
      </div>
      <CompareDialog ref="dialog" :images="processedImages" @success="onSuccess"></CompareDialog>
    </div>
  </PageContainer>
</template>

<style lang="scss" scoped>
.container {
  display: flex;
  flex-direction: column;
  height: calc(90vh - 50px); /* 容器总高度 */
  padding-bottom: 30px; /* 下半部分与页面底部分开 30 像素 */

  overflow: hidden;
}

/* 上半部分 */
.top-section {
  display: flex;
  justify-content: space-between;
  gap: 20px;
  flex: 1;
  overflow: hidden;
  width: 100%; /* 确保父容器宽度为 100% */
}

.left-top-container,
.right-container {
  flex: 1; /* 左右两边均分宽度 */
  display: flex;
  flex-direction: column;
  gap: 10px;
  max-width: 50%; /* 可选：限制最大宽度 */
}

.left-top {
  flex: 1;
  overflow-y: auto;
  padding: 10px;
  max-height: 100%;
  border-radius: 10px;
  box-sizing: border-box;
  background-color: rgb(67, 67, 67);
}

.right-container {
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.right-top {
  flex: 1;
  // overflow-y: auto;
  padding: 10px;
  border-radius: 10px;
  padding-top: 70px;
  // background-color: rgb(67, 67, 67);
}

/* 下半部分 */
.bottom {
  flex: 1;
  text-align: center;
  padding: 20px;
  overflow-y: auto;
}

.bottom h3 {
  text-align: left;
  margin: 0;
  padding: 10px 0;
  font-size: 18px;
}

.image-preview {
  margin-top: 10px;
}

.preview-image {
  max-width: 100%;
  height: auto;

  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

.progress-section {
  display: flex;
  flex-direction: column;
  gap: 25px; /* 每个进度条之间的间距 */
}

.progress-item {
  display: flex;
  flex-direction: column;
  gap: 15px; /* 标题、按钮和进度条之间的间距 */
}

.progress-header {
  display: flex;
  justify-content: flex-start;
  align-items: center; /* 垂直居中对齐 */
}

.progress-title {
  margin: 0;
  font-size: 16px;
}

.progress-bar {
  width: 100%; /* 进度条宽度 */
}
.el-button {
  margin-left: 200px; /* 按钮与标题之间的距离 */
}

.log-output {
  background-color: black;
  border: 1px solid white;
  border-radius: 5px;
  padding: 10px;
  height: 270px; /* 固定高度 */
  overflow-y: auto;
  color: white;
}

.log-output li {
  text-align: left; /* 每一行日志靠左对齐 */
  word-wrap: break-word; /* 如果日志内容过长，自动换行 */
}

.bottom-section {
  display: flex;
  gap: 20px;
  height: 40vh;
}

.log-container,
.csv-container {
  flex: 1;
  display: flex;
  flex-direction: column;
}

.log-output,
.csv-content {
  flex: 1;
  background-color: black;
  border: 1px solid white;
  border-radius: 5px;
  padding: 10px;
  overflow-y: auto;
  color: white;
  font-family: monospace;
  white-space: pre-wrap;
}

.csv-content pre {
  margin: 0;
}

h3 {
  text-align: left;
  margin: 0 0 10px 0;
  padding: 0;
  font-size: 18px;
}
</style>
