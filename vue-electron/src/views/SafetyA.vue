<script setup>
import { ref } from 'vue'
import { Select as SelectIcon } from '@element-plus/icons-vue'
import PageContainer from '@/components/PageContainer.vue'
import { SafetyService } from '../api/user.js'; // 引入接口服务

defineProps({
  title: {
    required: true,
    type: String
  }
})

const options = [
  { 
    label: '角色扮演与身份伪装', 
    description: '诱导模型突破预设道德约束，通过扮演特定角色绕过安全策略',
    value: 'A',
    icon: 'person'
  },
  { 
    label: '语义混淆与编码绕过',
    description: '通过编码转换、同义词替换或语法变形隐藏恶意意图', 
    value: 'B',
    icon: 'shuffle'
  },
  { 
    label: '分步拆解与间接诱导',
    description: '将敏感请求拆解为无害子问题，通过假设场景间接获取信息', 
    value: 'C',
    icon: 'layers'
  },
  { 
    label: '逻辑漏洞利用',
    description: '利用模型对矛盾指令或循环逻辑的处理缺陷', 
    value: 'D',
    icon: 'puzzle-piece'
  },
  { 
    label: '上下文注入与记忆欺骗',
    description: '通过长上下文干扰模型对当前对话的安全判断', 
    value: 'E',
    icon: 'memory'
  },
  { 
    label: '多模态攻击',
    description: '结合图像、代码等非文本输入触发模型解析漏洞', 
    value: 'F',
    icon: 'image'
  },
  { 
    label: '伦理悖论与虚假授权',
    description: '虚构授权或制造伦理困境迫使模型妥协', 
    value: 'G',
    icon: 'balance-scale'
  }
]

const selectedOptions = ref([])
const output = ref('')
const isButtonDisabled = ref(false)
const models = ref(['1', '2', '3', '4', '5', '6'])
const selectedModel = ref('1')
const isDefault = ref(false)

const toggleOption = (value) => {
  if (isButtonDisabled.value) return
  
  const index = selectedOptions.value.indexOf(value)
  if (index === -1) {
    selectedOptions.value.push(value)
  } else {
    selectedOptions.value.splice(index, 1)
  }
  
  isButtonDisabled.value = true
  setTimeout(() => {
    isButtonDisabled.value = false
  }, 300)
}

const handleConfirm = async () => {
  if (selectedOptions.value.length === 0) {
    output.value = '请至少选择一个选项'
    return
  }
  
  const confirmBtn = document.querySelector('.confirm-btn')
  confirmBtn.classList.add('animate-pulse')
  
  try {
    const response = await SafetyService({
      strategies: selectedOptions.value,
      strength: 1
    });

    if (response.data.success) {
      output.value = `你选择了：${selectedOptions.value.join(' + ')}，所选模型：${selectedModel.value}，结果：${response.data.data.join(', ')}`;
    } else {
      output.value = `请求失败：${response.data.message}`;
    }
  } catch (error) {
    output.value = `请求出错：${error.message}`;
  }

  confirmBtn.classList.remove('animate-pulse')
  
  const resultInput = document.querySelector('.result-output .el-input__inner')
  resultInput.classList.add('selection-success')
  
  setTimeout(() => {
    resultInput.classList.remove('selection-success')
  }, 1500)
}

const setDefaultModel = () => {
  localStorage.setItem('defaultModel', selectedModel.value)
}

const getProtectionMeasure = (strategyCode) => {
  const strategyMap = {
    'A': '加强身份验证和授权机制，严格审查角色权限',
    'B': '采用语义分析和自然语言处理技术，识别混淆语义',
    'C': '监控请求流程，识别分步诱导模式，加强数据访问控制',
    'D': '进行严格的代码审查和漏洞扫描，修复逻辑漏洞',
    'E': '控制上下文长度，定期清理缓存，防止记忆欺骗',
    'F': '对多模态输入进行严格的格式和内容检查',
    'G': '建立明确的伦理准则和合规机制，拒绝虚假授权请求'
  };
  return strategyMap[strategyCode] || '暂无对应防护措施';
}
</script>

<template>
  <PageContainer :title="'模型测试策略'" class="page-container">
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
      <div class="strategy-info">
        <p class="strategy-desc">
          从下方选择一种或多种攻击策略类型，系统将根据选择提供相应的防护建议和措施。
        </p>
        <div class="stats">
          <div class="stat-item">
            <div class="stat-value">7</div>
            <div class="stat-label">策略类型</div>
          </div>
          <div class="stat-item">
            <div class="stat-value">23+</div>
            <div class="stat-label">防护措施</div>
          </div>
          <div class="stat-item">
            <div class="stat-value">98%</div>
            <div class="stat-label">拦截成功率</div>
          </div>
        </div>
      </div>
      
      <div class="button-group">
        <el-tooltip 
          v-for="option in options"
          :key="option.value"
          placement="top"
          :content="option.description"
          popper-class="strategy-tooltip"
        >
          <el-button
            :type="selectedOptions.includes(option.value) ? 'primary' : 'default'"
            @click="toggleOption(option.value)"
            class="strategy-btn"
            :class="{ 'selected-button': selectedOptions.includes(option.value) }"
            :disabled="isButtonDisabled.value"
          >
            <i class="fa fa-{{ option.icon }} mr-2"></i>
            {{ option.label }}
            <span v-if="selectedOptions.includes(option.value)" class="check-icon">
              <i class="fa fa-check"></i>
            </span>
          </el-button>
        </el-tooltip>
      </div>
      
      <el-button 
        type="success" 
        @click="handleConfirm"
        class="confirm-btn"
      >
        确认选择
        <el-icon class="confirm-icon"><SelectIcon /></el-icon>
      </el-button>
      
      <div class="protection-preview" v-if="selectedOptions.length > 0">
        <h3 class="preview-title">防护措施预览</h3>
        <ul class="measure-list">
          <li v-for="value in selectedOptions" :key="value" class="measure-item">
            <i class="fa fa-shield-alt mr-2"></i>
            <span>{{ getProtectionMeasure(value) }}</span>
          </li>
        </ul>
      </div>

      <el-input
        v-model="output"
        placeholder="选择结果将显示在这里"
        readonly
        class="result-output"
        type="textarea"
        :autosize="{ minRows: 1 }"
      />
      
      
    </div>
  </PageContainer>
</template>

<style scoped>
.box-card {
  position: relative;
  min-height: 700px;
  border: 1px solid rgba(255, 255, 255, 0.1);
  border-radius: 16px;
  box-shadow: 0 12px 40px rgba(0, 0, 0, 0.3);
  overflow: hidden;
}


.title-container {
  display: flex;
  flex-direction: column;
}

.header h2 {
  color: #fff;
  font-size: 1.75rem;
  font-weight: 600;
  text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
  margin-bottom: 5px;
}

.subtitle {
  color: rgba(255, 255, 255, 0.6);
  font-size: 0.9rem;
}

.content {
  display: flex;
  flex-direction: column;
  gap: 30px;
  padding: 25px;
  position: relative;
  z-index: 1;
}

.strategy-info {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 10px;
}

.strategy-desc {
  color: rgba(255, 255, 255, 0.8);
  font-size: 1rem;
  max-width: 60%;
  line-height: 1.5;
}

.stats {
  display: flex;
  gap: 20px;
}

.stat-item {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 10px 15px;
  background: rgba(255, 255, 255, 0.05);
  border-radius: 8px;
  backdrop-filter: blur(3px);
  transition: all 0.3s ease;
}

.stat-item:hover {
  transform: translateY(-3px);
  background: rgba(255, 255, 255, 0.08);
}

.stat-value {
  color: #409eff;
  font-size: 1.25rem;
  font-weight: 600;
  margin-bottom: 3px;
}

.stat-label {
  color: rgba(255, 255, 255, 0.6);
  font-size: 0.8rem;
}

.button-group {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 18px;
}

.el-button {
  position: relative;
  height: auto;
  min-height: 60px;
  font-weight: 500;
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  border: 2px solid transparent;
  background: rgba(255, 255, 255, 0.05);
  color: rgba(255, 255, 255, 0.8);
  border-radius: 10px;
  overflow: hidden;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 12px 15px;
  text-align: center;
}

.el-button::before {
  content: '';
  position: absolute;
  top: 0;
  left: -100%;
  width: 100%;
  height: 100%;
  background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.1), transparent);
  transition: all 0.6s ease;
}

.el-button:hover::before {
  left: 100%;
}

.strategy-btn:hover {
  transform: translateY(-3px);
  box-shadow: 0 6px 16px rgba(0, 0, 0, 0.25);
  background: rgba(255, 255, 255, 0.08);
}

.selected-button {
  background: linear-gradient(135deg, #409eff, #3375ff) !important;
  color: white !important;
  border-color: rgba(255, 255, 255, 0.2) !important;
  box-shadow: 0 8px 24px rgba(64, 158, 255, 0.3) !important;
  transform: translateY(-2px);
}

.selected-button:hover {
  box-shadow: 0 10px 28px rgba(64, 158, 255, 0.4) !important;
  transform: translateY(-4px);
}

.check-icon {
  margin-left: 8px;
  font-size: 1.1em;
  color: #fff;
  filter: drop-shadow(0 1px 2px rgba(0, 0, 0, 0.3));
}

.confirm-btn {
  width: 220px;
  padding: 15px 25px;
  font-size: 1.1rem;
  align-self: flex-end;
  background: linear-gradient(45deg, #67c23a, #4ca830);
  border: none;
  border-radius: 10px;
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  display: flex;
  justify-content: center;
  align-items: center;
  position: relative;
  overflow: hidden;
}

.confirm-btn:hover {
  transform: scale(1.05);
  box-shadow: 0 8px 24px rgba(103, 194, 58, 0.4);
}

.confirm-btn::before {
  content: '';
  position: absolute;
  top: -50%;
  left: -50%;
  width: 200%;
  height: 200%;
  background: radial-gradient(circle, rgba(255, 255, 255, 0.15) 0%, transparent 70%);
  opacity: 0;
  transition: opacity 0.3s ease;
}

.confirm-btn:hover::before {
  opacity: 1;
}

.confirm-icon {
  margin-left: 10px;
  font-size: 1.2em;
}

.animate-pulse {
  animation: pulse 1.5s cubic-bezier(0.4, 0, 0.6, 1) infinite;
}

@keyframes pulse {
  0%, 100% {
    opacity: 1;
  }
  50% {
    opacity: 0.7;
  }
}

.result-output {
  max-width: none; 
  width: 100%;
  margin-top: 15px;
  transition: all 0.3s ease;
}


.result-output:hover {
  transform: scale(1.01);
}

.el-input :deep(.el-input__inner) {
  background: rgba(255, 255, 255, 0.05);
  color: #fff;
  font-size: 1.1rem;
  padding: 14px 20px;
  transition: all 0.3s ease;
  height: auto;
  min-height: 50px;
}

.el-input :deep(.el-input__inner):focus {
  border-color: #409eff;
  box-shadow: 0 0 12px rgba(64, 158, 255, 0.3);
}

.selection-success {
  border-color: #67c23a !important;
  box-shadow: 0 0 12px rgba(103, 194, 58, 0.3) !important;
  animation: success-pulse 1.5s ease-in-out;
}

@keyframes success-pulse {
  0%, 100% {
    box-shadow: 0 0 12px rgba(103, 194, 58, 0.3);
  }
  50% {
    box-shadow: 0 0 20px rgba(103, 194, 58, 0.6);
  }
}

.strategy-tooltip.el-tooltip__popper {
  max-width: 350px;
  background: rgba(40, 40, 40, 0.95);
  border: 1px solid rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(8px);
  color: #fff;
  padding: 14px 16px;
  border-radius: 8px;
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.4);
  font-size: 0.9rem;
  line-height: 1.5;
}

.strategy-tooltip.el-tooltip__popper[x-placement^=top] .popper__arrow {
  border-top-color: rgba(255, 255, 255, 0.1);
}

.protection-preview {
  margin-top: 25px;
  padding: 20px;
  background: rgba(255, 255, 255, 0.03);
  border-radius: 10px;
  backdrop-filter: blur(3px);
  border: 1px solid rgba(255, 255, 255, 0.05);
  transition: all 0.3s ease;
}

.protection-preview:hover {
  background: rgba(255, 255, 255, 0.05);
}

.preview-title {
  color: rgba(255, 255, 255, 0.9);
  font-size: 1.2rem;
  font-weight: 500;
  margin-bottom: 15px;
  display: flex;
  align-items: center;
}

.preview-title::before {
  content: '';
  width: 4px;
  height: 18px;
  background: #409eff;
  border-radius: 2px;
  margin-right: 10px;
}

.measure-list {
  list-style: none;
  padding: 0;
  margin: 0;
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.measure-item {
  color: rgba(255, 255, 255, 0.7);
  font-size: 0.95rem;
  padding: 8px 12px;
  background: rgba(255, 255, 255, 0.05);
  border-radius: 6px;
  transition: all 0.3s ease;
  display: flex;
  align-items: center;
}

.measure-item:hover {
  background: rgba(255, 255, 255, 0.08);
  transform: translateX(2px);
}

.measure-item i {
  color: #409eff;
  min-width: 20px;
}

/* 新增选择器样式 */
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
</style>