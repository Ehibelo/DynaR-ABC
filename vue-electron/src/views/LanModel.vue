<script setup>
import PageContainer from '@/components/PageContainer.vue'
import { generateSemanticTestcasesService } from '@/api/user'
import { ref } from 'vue'

const messages = ref([])
const showHelpSection = ref(true)
const inputMessage = ref('')

const models = ref(['1', '2', '3', '4', '5', '6'])
const selectedModel = ref('1')
const isDefault = ref(false)


const handleSend = async () => {
  if (!inputMessage.value.trim()) return

  // 添加用户消息
  messages.value.push({
    content: inputMessage.value,
    isUser: true
  })

  showHelpSection.value = false

  try {
    const response = await generateSemanticTestcasesService({
      sentence: inputMessage.value,
      dimensions: Number(selectedModel.value)
    })

    // 添加AI回复
    messages.value.push({
      content: formatTestcases(response.data.testcases),
      isUser: false
    })

  } catch (error) {
    messages.value.push({
      content: `生成失败: ${error.message}`,
      isUser: false
    })
  }
}

const setDefaultModel = () => {
  localStorage.setItem('defaultModel', selectedModel.value)
}

const formatTestcases = (testcases) => {
  return testcases
    .map((tc, index) => `${index + 1}. ${tc.join('')}`)
    .join('\n')
}
</script>

<template>
  <PageContainer :title="'大语言模型测试'" class="page-container">
    <div class="model-selector">
      <select v-model="selectedModel" class="model-dropdown">
        <option v-for="model in models" :key="model" :value="model">{{ model }}</option>
      </select>
      <label class="default-label">
        <input
          type="checkbox"
          v-model="isDefault"
          @change="setDefaultModel"
          class="default-checkbox"
        />
        <span>设为默认</span>
      </label>
    </div>
    <div class="content">
      <!-- 帮助区域 -->
      <div class="help-section" v-if="showHelpSection">
        <p class="help-text">Hello 北极涛_glH</p>
        <p class="help-text">How can I help you today?</p>
        <div class="option-group">
          <div class="option-item">
            <h4>语义转换</h4>
            <p class="option-description">根据问题进行语义划分</p>
          </div>
          <div class="option-item">
            <h4>同义替换</h4>
            <p class="option-description">对于单一词语进行同义替换</p>
          </div>
          <div class="option-item">
            <h4>组合覆盖</h4>
            <p class="option-description">所有分割全覆盖</p>
          </div>
          <div class="option-item">
            <h4>质量不变</h4>
            <p class="option-description">指令集质量不变</p>
          </div>
        </div>
      </div>

      <!-- 对话记录区域 -->
      <div class="chat-container">
        <div
          v-for="(msg, index) in messages"
          :key="index"
          :class="['message-bubble', msg.isUser ? 'user' : 'ai']"
        >
          {{ msg.content }}
        </div>
      </div>

      <!-- 输入区域 -->
      <div class="bottom-section">
        <div class="input-container">
          <button class="plus-button">+</button>
          <input
            v-model="inputMessage"
            type="text"
            class="message-input"
            placeholder="Send a message"
            @keyup.enter="handleSend"
          />
          <button class="send-button" @click="handleSend">
            <img src="@/assets/send1.png" alt="Send" />
          </button>
        </div>
      </div>
    </div>
  </PageContainer>
</template>

<style scoped>
.page-container {
  background: rgb(30, 30, 30);
  color: white;
}

.help-section {
  padding: 0 16px;
  margin-top: 100px;
  user-select: none;
}

.help-text {
  color: #848992;
  margin-bottom: 32px;
  font-size: 30px;
  text-align: center;
}

.option-group {
  display: flex;
  flex-wrap: wrap;
  gap: 16px;
}

.option-item {
  width: calc(50% - 8px);
  border-radius: 8px;
  background-color: #3a3c42;
  padding: 16px;
  transition: all 0.2s;
  box-sizing: border-box;
}

.option-item h4 {
  font-size: 16px;
  margin: 0 0 4px 0;
  color: #dbe2e4;
}

.option-description {
  color: #dbe2e4;
  font-size: 14px;
  margin: 0;
}

.bottom-section {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  background: rgb(30, 30, 30);
  padding: 16px;
}

.input-container {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 8px 12px;
}

.message-input {
  flex: 1;
  border: none;
  outline: none;
  font-size: 14px;
  padding: 8px;
  background: transparent;
  color: white;
}

.plus-button {
  color: #3b82f6;
  font-size: 20px;
  background: none;
  border: none;
  padding: 0;
  cursor: pointer;
}

.send-button {
  display: flex;
  align-items: center;
  height: 100%;
  padding: 0 8px;
  background: none;
  border: none;
  cursor: pointer;
}

.send-button img {
  height: 24px;
  width: auto;
}

.chat-container {
  padding: 20px;
  flex: 1;
  overflow-y: auto;
  max-height: calc(100vh - 300px);
}

.message-bubble {
  max-width: 70%;
  padding: 12px 16px;
  margin: 8px 0;
  border-radius: 12px;
  word-break: break-word;
  animation: fadeIn 0.3s ease-in;
}

.user {
  background: #3b82f6;
  color: white;
  margin-left: auto;
}

.ai {
  background: #3a3c42;
  color: #dbe2e4;
  margin-right: auto;
}

@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(10px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.model-selector {
  position: absolute;
  top: 20px;
  right: 20px;
  display: flex;
  align-items: center;
  gap: 12px;
  z-index: 100;
}

.model-dropdown {
  background: #3a3c42;
  color: white;
  border: 1px solid #4b4d54;
  border-radius: 6px;
  padding: 8px 12px;
  font-size: 14px;
  appearance: none;
  width: 120px;
}

.default-label {
  display: flex;
  align-items: center;
  gap: 6px;
  color: #848992;
  font-size: 13px;
  cursor: pointer;
}

.default-checkbox {
  accent-color: #3b82f6;
}

.message-bubble.ai {
  white-space: pre-wrap; /* 保留换行符 */
  line-height: 1.8;      /* 增加行间距 */
}

</style>
