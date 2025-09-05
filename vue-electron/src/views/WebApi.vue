<script setup>
import { ref } from 'vue'
import { Search } from '@element-plus/icons-vue'
import PageContainer from '@/components/PageContainer.vue'
import { userWebapiService } from '@/api/user'

const url = ref('')
const isLoading = ref(false)
const logs = ref([])
const terminalRef = ref(null)
const start = async () => {
  if (!url.value) return

  isLoading.value = true
  logs.value = [] // 清空之前的日志

  try {
    const { data } = await userWebapiService({ info: url.value })

    if (data.success && data.result) {
      // 处理返回的测试结果文本
      processTestResult(data.result)
    } else {
      logs.value.push({
        type: 'error',
        message: data.error || '测试执行失败，请检查服务端日志'
      })
    }
  } catch (error) {
    logs.value.push({
      type: 'error',
      message: `请求失败: ${error.message}`
    })
  } finally {
    isLoading.value = false
    // 滚动到底部
    setTimeout(() => {
      if (terminalRef.value) {
        terminalRef.value.scrollTop = terminalRef.value.scrollHeight
      }
    }, 100)
  }
}

// 处理测试结果文本
const processTestResult = (resultText) => {
  // 按空行分割成不同段落
  const paragraphs = resultText.split(/\n\s*\n/)

  paragraphs.forEach((para) => {
    if (!para.trim()) return

    // 确定消息类型
    let type = 'info'
    if (para.includes('执行失败')) type = 'error'
    if (para.includes('执行成功率')) type = 'success'
    if (para.includes('测试用例执行总结')) type = 'success'

    logs.value.push({
      type,
      message: para.trim()
    })
  })
}
</script>

<template>
  <PageContainer title="浏览器接口测试">
    <div class="container">
      <div class="input-group">
        <el-input
          v-model="url"
          placeholder="输入要测试的网页地址"
          required
          class="url-input"
          @keyup.enter="start"
        >
          <template #append>
            <el-button
              type="primary"
              @click="start"
              :disabled="isLoading || !url"
              class="action-btn"
              :icon="Search"
            >
              <el-icon class="icon-spin" v-if="isLoading">
                <Loading />
              </el-icon>
              <span v-else></span>
            </el-button>
          </template>
        </el-input>
      </div>

      <div v-if="isLoading" class="loader">
        <div class="spinner"></div>
        <span>正在分析网页内容...</span>
      </div>

      <div class="terminal" ref="terminalRef">
        <el-scrollbar height="500px">
          <div v-for="(log, index) in logs" :key="index" :class="['log', log.type]">
            <pre>{{ log.message }}</pre>
          </div>
          <div v-if="logs.length === 0" class="empty-tip">测试结果将显示在这里...</div>
        </el-scrollbar>
      </div>
    </div>
  </PageContainer>
</template>

<style scoped>
/* 容器基础样式 */
.container {
  padding: 20px;
  max-width: 1000px;
  margin: 0 auto;
}

/* ========== 输入框组样式 ========== */
:deep(.el-input-group) {
  position: relative;
  border-radius: 8px;
  overflow: hidden;
}

/* 输入框主体样式 */
:deep(.el-input__wrapper) {
  padding-right: 70px; /* 根据新按钮宽度调整 */
  height: 50px; /* 输入框总高度 */
  border: 1px solid #dcdfe6; /* 添加永久边框 */
  border-radius: 8px;
  transition: all 0.3s;
}

/* 输入框交互状态 */
:deep(.el-input__wrapper:hover),
:deep(.el-input__wrapper:focus) {
  border-color: #409eff; /* 使用边框颜色代替阴影 */
  box-shadow: 0 0 0 1px #409eff; /* 添加发光效果 */
}

/* ========== 按钮容器样式 ========== */
:deep(.el-input-group__append) {
  position: absolute;
  right: 0px;
  top: 3px; /* 顶部对齐调整 */
  bottom: 3px; /* 底部对齐调整 */
  padding: 0;
  margin: 0;
  border: none;
  background: transparent;
  z-index: 2;
}

/* ========== 按钮本体样式 ========== */
/* ========== 按钮样式优化 ========== */
:deep(.el-input-group__append .el-button) {
  height: 54px;
  width: 54px;
  padding: 0;
  padding-bottom: 4px;
  margin: 3px;
  border: none;
  border-radius: 8px;
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

/* 图标样式 */
:deep(.el-input-group__append .el-button .el-icon) {
  font-size: 24px;
  color: rgba(255, 255, 255, 0.9);
  filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.1));
  transition: transform 0.3s;
}

/* 悬停效果 */
:deep(.el-input-group__append .el-button:hover) {
  transform: scale(0.96);
  box-shadow: 0 4px 12px rgba(64, 158, 255, 0.3);

  .el-icon {
    transform: scale(1.1);
  }
}

/* 禁用状态 */
:deep(.el-input-group__append .el-button.is-disabled) {
  background: linear-gradient(135deg, #a0cfff, #88b5e0);
  opacity: 0.8;

  .el-icon {
    filter: grayscale(1);
  }
}

/* 加载动画 */
.icon-spin {
  animation: spin 1s linear infinite;
}

@keyframes spin {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}
/* 加载指示器 */
.loader {
  display: flex;
  align-items: center;
  gap: 10px;
  margin: 10px 0;
  color: #409eff;
}

.spinner {
  width: 20px;
  height: 20px;
  border: 3px solid rgba(64, 158, 255, 0.2);
  border-top: 3px solid #409eff;
  border-radius: 50%;
  animation: spin 1s linear infinite;
}

@keyframes spin {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}

/* 终端样式 */
.terminal {
  background: #1e1e1e;
  color: #e0e0e0;
  padding: 15px;
  border-radius: 8px;
  font-family: 'Courier New', monospace;
  margin-top: 20px;
  min-height: 300px;
}

/* 日志条目样式 */
.log {
  padding: 8px 0;
  line-height: 1.5;
  border-bottom: 1px solid #333;
}

.log:last-child {
  border-bottom: none;
}

.log pre {
  margin: 0;
  white-space: pre-wrap;
  font-family: inherit;
}

/* 日志类型颜色 */
.log.info {
  color: #e0e0e0;
}

.log.error {
  color: #ff6b6b;
}

.log.success {
  color: #6bff6b;
}

/* 空状态提示 */
.empty-tip {
  color: #777;
  text-align: center;
  padding: 20px;
  font-style: italic;
}

/* 响应式调整 */
@media (max-width: 768px) {
  .container {
    padding: 10px;
  }

  .terminal {
    padding: 10px;
  }
}
</style>
