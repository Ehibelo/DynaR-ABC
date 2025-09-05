<script setup>
import { ElMessage } from 'element-plus'
import { ref, computed, watch } from 'vue'
import { userFormService } from '@/api/user'
import { userUpdateFormService } from '@/api/user'
import { generate_testcasesService } from '@/api/user'
import { update_testcasesService } from '@/api/user'
import { createIqpsoService, updateIqpsoService } from '@/api/user'

const dialogvisible = ref()
const isEdit = ref(false)
const emit = defineEmits(['success'])
let id = ''

const isDisabled = computed(() => isEdit.value)

const open = (row, isEditMode) => {
  dialogvisible.value = true
  isEdit.value = isEditMode

  // 初始化表单模型
  formModel.value = {
    algorType: '',
    parameterType: 'int',
    count: '',
    size: '',
    weight: '',
    num: '',
    strength: '',
    position: '',
    parameter: ''
  }

  // 直接复制传入的行数据
  Object.assign(formModel.value, row)

  // 特殊字段处理
  if (isEditMode) {
    // 设置算法类型（不可修改）
    formModel.value.algorType = row.algorType

    // ABC 算法特殊处理
    if (row.algorType === 'DynaR-ABC') {
      // 确保字段正确映射
      formModel.value.num = row.num
      formModel.value.strength = row.strength
      formModel.value.parameter = row.parameter
    }
    // IQPSO 算法特殊处理
    else if (row.algorType === 'IQPSO') {
      formModel.value.strength = row.t_way || row.strength
      formModel.value.parameter = row.parameters
        ? Array.isArray(row.parameters)
          ? row.parameters.join(',')
          : row.parameters
        : row.parameter
    }
  }

  console.log('打开对话框，表单数据:', formModel.value)
}
const formModel = ref({
  algorType: '',
  parameterType: '',
  count: '',
  size: '',
  weight: '',
  num: '',
  strength: '',
  position: '',
  parameter: ''
})

const formref = ref()

// 基础验证规则
const baseRules = {
  num: [{ required: true, message: '请输入参数个数', trigger: 'blur' }],
  strength: [{ required: true, message: '请输入覆盖力度', trigger: 'blur' }],
  parameter: [{ required: true, message: '请输入参数取值', trigger: 'blur' }]
}

// 动态计算验证规则
const rules = computed(() => {
  const rules = { ...baseRules }
  return rules
})

// 监听算法类型变化，重置表单验证
watch(
  () => formModel.value.algorType,
  () => {
    formref.value?.clearValidate()
  }
)

const onsubmit = async () => {
  console.log('提交表单:', formModel.value)

  const valid = await formref.value.validate()

  if (valid) {
    try {
      const formData = { ...formModel.value }
      let apiPromise = null

      // 统一参数转换逻辑 - 直接转换为数组
      if (formModel.value.parameterType === 'enum') {
        // 处理范围格式，如 "1-3;5-7" 转换为 [1,2,3,5,6,7]
        formData.parameters = formData.parameter
          .split(';')
          .map((range) => {
            const [start, end] = range.split('-').map(Number)
            return Array.from({ length: end - start + 1 }, (_, i) => start + i)
          })
          .flat()
      } else {
        // 处理单个值格式，如 "1,2,3" 转换为 [1,2,3]
        formData.parameters = formData.parameter.split(',').map((param) => {
          // 尝试转换为数字，如果无法转换则保持为字符串
          const num = Number(param)
          return isNaN(num) ? param : num
        })
      }

      // ABC算法处理
      if (formModel.value.algorType === 'DynaR-ABC') {
        const apiData = {
          id: formModel.value.id,
          strength: formModel.value.strength,
          paramCount: formModel.value.num,
          paramValues: formData.parameters // 直接使用数组格式
        }
        apiPromise = isEdit.value
          ? update_testcasesService(apiData)
          : generate_testcasesService(apiData)
      }
      // PSO系列算法
      else if (formModel.value.algorType === 'dbniche-pso') {
        const psoParams = {
          count: formModel.value.count,
          size: formModel.value.size,
          weight: formModel.value.weight,
          num: formModel.value.num,
          strength: formModel.value.strength,
          position: formModel.value.position,
          parameter: formData.parameters // 直接使用数组格式
        }

        apiPromise = isEdit.value
          ? userUpdateFormService(psoParams)
          : userFormService(
              psoParams.count,
              psoParams.size,
              psoParams.weight,
              psoParams.num,
              psoParams.strength,
              psoParams.position,
              psoParams.parameter
            )
      }
      // IQPSO算法
      else if (formModel.value.algorType === 'IQPSO') {
        const t_way = parseInt(formData.strength)

        if (isEdit.value) {
          apiPromise = updateIqpsoService(id, t_way, formData.parameters)
        } else {
          apiPromise = createIqpsoService(t_way, formData.parameters)
        }
      }

      if (apiPromise) {
        const response = await apiPromise
        console.log('请求成功:', response)
        ElMessage.success('操作成功')
        dialogvisible.value = false
        emit('success')
      }
    } catch (error) {
      console.error('请求错误:', error)
      ElMessage.error(error.response?.data?.error || error.message || '操作失败')
    }
  } else {
    ElMessage.error('表单验证失败')
  }
}

defineExpose({ open })
</script>

<template class="dark">
  <el-dialog v-model="dialogvisible" :title="isEdit ? '查看输入数据' : '添加数据'" width="50%">
    <el-form
      ref="formref"
      :model="formModel"
      label-width="150px"
      style="padding-top: 20px"
      :rules="rules"
      :disabled="isEdit"
    >
      <!-- 只读模式下的标题 -->
      <div v-if="isEdit" class="readonly-header">
        <h3>原始输入数据（只读）</h3>
        <el-divider />
      </div>

      <!-- 算法信息展示 -->
      <el-form-item label="算法类型" prop="algorType">
        <el-tag v-if="isEdit" type="info" size="large">{{ formModel.algorType || 'N/A' }}</el-tag>
        <el-select v-else v-model="formModel.algorType" placeholder="请选择算法">
          <el-option label="dbniche-pso" value="dbniche-pso"></el-option>
          <el-option label="DynaR-ABC" value="DynaR-ABC"></el-option>
          <el-option label="IQPSO" value="IQPSO"></el-option>
        </el-select>
      </el-form-item>

      <!-- 参数信息分组展示 -->
      <el-card v-if="formModel.algorType" class="param-group">
        <template #header>
          <div class="card-header">
            <span>参数配置</span>
          </div>
        </template>

        <el-form-item label="参数取值类型" prop="parameterType">
          <el-tag v-if="isEdit" type="info">{{ formModel.parameterType || 'N/A' }}</el-tag>
          <el-select v-else v-model="formModel.parameterType" placeholder="请选择参数取值类型">
            <el-option label="单个数据" value="int"></el-option>
            <el-option label="数据的范围" value="enum"></el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="参数取值" prop="parameter">
          <el-input
            :placeholder="
              formModel.parameterType === 'int'
                ? '请输入参数取值(用逗号分隔)'
                : '请输入参数范围(用-分隔)'
            "
            v-model="formModel.parameter"
            :readonly="isEdit"
          ></el-input>
        </el-form-item>

        <el-form-item label="参数个数" prop="num">
          <el-input
            placeholder="请输入参数个数"
            v-model="formModel.num"
            :readonly="isEdit"
          ></el-input>
        </el-form-item>

        <el-form-item label="覆盖力度" prop="strength">
          <el-input
            placeholder="请输入覆盖力度(用逗号分隔)"
            v-model="formModel.strength"
            :readonly="isEdit"
          ></el-input>
        </el-form-item>
      </el-card>

      <!-- PSO特定参数 -->
      <el-card v-if="formModel.algorType === 'dbniche-pso'" class="param-group">
        <template #header>
          <div class="card-header">
            <span>PSO算法参数</span>
          </div>
        </template>

        <el-form-item label="迭代次数" prop="count">
          <el-input
            placeholder="请输入迭代次数"
            v-model="formModel.count"
            :readonly="isEdit"
          ></el-input>
        </el-form-item>

        <el-form-item label="种群规模" prop="size">
          <el-input
            placeholder="请输入种群规模"
            v-model="formModel.size"
            :readonly="isEdit"
          ></el-input>
        </el-form-item>

        <el-form-item label="惯性权重" prop="weight">
          <el-input
            placeholder="请输入惯性权重"
            v-model="formModel.weight"
            :readonly="isEdit"
          ></el-input>
        </el-form-item>

        <el-form-item label="覆盖位置" prop="position">
          <el-input
            placeholder="请输入覆盖位置（用;分割）"
            v-model="formModel.position"
            :readonly="isEdit"
          ></el-input>
        </el-form-item>
      </el-card>

      <!-- 原始数据预览 -->
      <div v-if="isEdit" class="data-preview">
        <h3>原始输入预览</h3>
        <el-divider />
        <el-descriptions :column="1" border>
          <el-descriptions-item label="算法类型">{{
            formModel.algorType || 'N/A'
          }}</el-descriptions-item>
          <el-descriptions-item label="参数取值类型">{{
            formModel.parameterType || 'N/A'
          }}</el-descriptions-item>
          <el-descriptions-item label="参数取值">{{
            formModel.parameter || 'N/A'
          }}</el-descriptions-item>
          <el-descriptions-item label="参数个数">{{ formModel.num || 'N/A' }}</el-descriptions-item>
          <el-descriptions-item label="覆盖力度">{{
            formModel.strength || 'N/A'
          }}</el-descriptions-item>
          <template v-if="formModel.algorType === 'dbniche-pso'">
            <el-descriptions-item label="迭代次数">{{
              formModel.count || 'N/A'
            }}</el-descriptions-item>
            <el-descriptions-item label="种群规模">{{
              formModel.size || 'N/A'
            }}</el-descriptions-item>
            <el-descriptions-item label="惯性权重">{{
              formModel.weight || 'N/A'
            }}</el-descriptions-item>
            <el-descriptions-item label="覆盖位置">{{
              formModel.position || 'N/A'
            }}</el-descriptions-item>
          </template>
        </el-descriptions>
      </div>
    </el-form>

    <template #footer>
      <div class="dialog-footer">
        <!-- 编辑模式下只显示关闭按钮 -->
        <el-button v-if="isEdit" @click="dialogvisible = false">关闭</el-button>

        <!-- 添加模式下显示取消和确认按钮 -->
        <template v-else>
          <el-button @click="dialogvisible = false">取消</el-button>
          <el-button type="primary" @click="onsubmit">确认</el-button>
        </template>
      </div>
    </template>
  </el-dialog>
</template>
