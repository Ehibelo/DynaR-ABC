<script setup>
import { ElMessage } from 'element-plus'
import { ref, watch } from 'vue'
import { submitComparisonService } from '@/api/user'

const props = defineProps({
  images: {
    type: Array,
    default: () => []
  }
})

const emit = defineEmits(['success']) // 声明要触发的事件

watch(
  () => props.images,
  (newVal) => {
    if (newVal.length > 0) {
      initFormData()
    }
  },
  { immediate: true }
)

const dialogVisible = ref(false)
const formRef = ref()
const comparisonResults = ref([])

const initFormData = () => {
  comparisonResults.value = props.images.map((img, index) => ({
    id: img.filename,
    imageName: img.filename,
    result: '',
    comment: ''
  }))
}

const open = () => {
  dialogVisible.value = true
}

const rules = {
  result: [{ required: true, message: '请选择结果', trigger: 'change' }]
}

const onSubmit = async () => {
  try {
    const valid = await formRef.value.validate()
    if (!valid) return

    const submissionData = {
      comparisons: comparisonResults.value.map((item) => ({
        imageUrl: props.images.find((img) => img.filename === item.imageName)?.url,
        result: item.result,
        comment: item.comment
      }))
    }
    ElMessage.success('比对结果提交成功')
    dialogVisible.value = false
    emit('success') // 确保触发success事件
  } catch (error) {
    ElMessage.error(`提交失败: ${error.message}`)
    dialogVisible.value = false // 失败时也关闭对话框
  }
}

defineExpose({ open })
</script>

<template>
  <el-dialog v-model="dialogVisible" title="数据比对" width="50%">
    <el-form ref="formRef" :model="comparisonResults" label-position="top">
      <el-form-item
        v-for="(item, index) in comparisonResults"
        :key="item.id"
        :label="`图片 ${index + 1}: ${item.imageName}`"
        :prop="`${index}.result`"
        :rules="rules"
      >
        <div class="comparison-item">
          <el-radio-group v-model="item.result">
            <el-radio label="pass">通过</el-radio>
            <el-radio label="fail">不通过</el-radio>
          </el-radio-group>
        </div>
      </el-form-item>
    </el-form>

    <template #footer>
      <el-button @click="dialogVisible = false">取消</el-button>
      <el-button type="primary" @click="onSubmit">提交</el-button>
    </template>
  </el-dialog>
</template>
