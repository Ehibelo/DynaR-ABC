<script setup>
import PageContainer from '@/components/PageContainer.vue'
import ChannelEdit from '@/components/ChannelEdit.vue'
import { deleteUserFormService } from '@/api/user'
import { Edit, Delete } from '@element-plus/icons-vue'
import { ref } from 'vue'
import { ElMessage } from 'element-plus'
import { userGetFormService } from '@/api/user'
import { getGeneratedTestcasesService } from '@/api/user'
import { delete_testcasesService } from '@/api/user'
import { getIqpsoService, deleteIqpsoService, updateIqpsoService } from '@/api/user'

const list = ref([])
const loading = ref(false)
const dialog = ref()

// 修改 onEdit 方法
const onEdit = (row, $index) => {
  console.log('编辑行数据:', row)

  // 根据算法类型转换数据结构
  const formData = { ...row }

  // ABC 算法数据转换
  if (row.algorType === 'DynaR-ABC') {
    // 直接使用映射后的字段
    formData.num = row.num
    formData.strength = row.strength
    formData.parameter = row.parameter
  }
  // IQPSO 算法数据转换
  else if (row.algorType === 'IQPSO') {
    formData.strength = row.t_way || row.strength
    formData.parameter = Array.isArray(row.parameters) ? row.parameters.join(',') : row.parameters
  }

  // 打开对话框
  dialog.value.open(formData, true)
}

// 统一删除逻辑
const onDelete = async (row, $index) => {
  try {
    if (list.value.includes(row)) {
      await deleteUserFormService(row.id)
    } else if (generatedList.value.includes(row)) {
      await delete_testcasesService(row.id)
    } else if (iqpsoList.value.includes(row)) {
      await deleteIqpsoService(row.id)
    }
    window.location.reload()
  } catch (error) {
    console.error('删除失败:', error)
  }
}

const addchannel = () => {
  dialog.value.open({}, false)
}

// 新增工具函数：处理PSO结果
const formatPSOResult = (result) => {
  if (!result) return []
  if (Array.isArray(result)) {
    return result.map((item) => (Array.isArray(item) ? item.join(', ') : item))
  }
  return result.split(';').filter((item) => item.trim())
}

// 新增工具函数：处理ABC测试用例
const formatABCTestcase = (testcase) => {
  if (!testcase) return []
  if (Array.isArray(testcase)) {
    return testcase.map((item) => (Array.isArray(item) ? item.join(', ') : item))
  }
  // 使用|分隔字符串，并过滤空值
  return testcase.split('|').filter((item) => item.trim())
}

// 获取PSO数据
const getdata = async () => {
  loading.value = true
  try {
    const data = await userGetFormService()
    list.value = data.data.data
  } catch (error) {
    console.error('Error fetching data:', error)
  } finally {
    loading.value = false
  }
}

getdata()

// 获取ABC数据
const generatedList = ref([])
const loadingGenerated = ref(false)

const getGeneratedTestcasesData = async () => {
  loadingGenerated.value = true
  try {
    const data = await getGeneratedTestcasesService()
    generatedList.value = data.data.data.map((item) => ({
      ...item,
      algorType: 'DynaR-ABC', // 添加算法类型标识

      // 确保字段名称与表单匹配
      num: item.param_count, // 映射参数个数
      strength: item.strength, // 映射覆盖力度
      parameter: item.param_values // 映射参数取值
    }))
    console.log('ABC 数据映射结果:', generatedList.value)
  } catch (error) {
    console.error('Error fetching generated testcases:', error)
  } finally {
    loadingGenerated.value = false
  }
}
getGeneratedTestcasesData()

// 获取IQPSO数据 - 修复数据处理逻辑
const iqpsoList = ref([])
const loadingIqpso = ref(false)

const getIqpsoData = async () => {
  loadingIqpso.value = true
  try {
    const response = await getIqpsoService()
    console.log('IQPSO API响应:', response)
    // 调整判断条件
    if (response && Array.isArray(response.data)) {
      iqpsoList.value = response.data
      console.log('成功获取IQPSO数据:', iqpsoList.value)
    } else {
      iqpsoList.value = []
      console.error('IQPSO数据格式错误:', response)
      ElMessage.error('获取IQPSO数据失败，请检查API响应')
    }
  } catch (error) {
    console.error('获取IQPSO数据失败:', error)
    ElMessage.error('获取IQPSO数据失败:', error.message)
  } finally {
    loadingIqpso.value = false
  }
}

getIqpsoData()

// 统一成功回调
// 统一成功回调
const onSuccess = async (data) => {
  console.log('onSuccess参数', data)
  if (!data) window.location.reload()
}

// 修改 onIqpsoEdit 方法
const onIqpsoEdit = (row, $index) => {
  // 将 IQPSO 数据结构转换为表单需要的格式
  const formData = {
    ...row,
    algorType: 'IQPSO',
    strength: row.t_way,
    parameter: Array.isArray(row.parameters) ? row.parameters.join(',') : row.parameters
  }
  dialog.value.open(formData, true)
}
</script>

<template>
  <PageContainer title="用例生成" class="page">
    <template #extra>
      <!-- 添加 gradient-button 类到添加分类按钮 -->
      <el-button type="primary" class="gradient-button" @click="addchannel">添加数据</el-button>
    </template>

    <!-- PSO表格 -->
    <el-table :data="list" style="width: 100%" v-loading="loading">
      <el-table-column label="序号" width="150" type="index"></el-table-column>
      <el-table-column label="nichepso输出结果">
        <template #default="{ row }">
          <div v-if="row.result">
            <el-tag
              v-for="(item, index) in formatPSOResult(row.result)"
              :key="index"
              effect="plain"
              class="mr-2 mb-2"
            >
              {{ item }}
            </el-tag>
          </div>
          <div v-else>
            <el-empty description="无结果" image-size="60" />
          </div>
        </template>
      </el-table-column>
      <el-table-column label="修改与删除" width="100">
        <template #default="{ row, $index }">
          <el-button
            :icon="Edit"
            type="primary"
            circle
            class="gradient-button"
            @click="onEdit(row, $index)"
            plain
          ></el-button>
          <el-button
            :icon="Delete"
            type="danger"
            circle
            class="gradient-button"
            @click="onDelete(row, $index)"
            plain
          ></el-button>
        </template>
      </el-table-column>
      <template #empty>
        <el-empty description="没有PSO数据"></el-empty>
      </template>
    </el-table>

    <!-- ABC表格 -->
    <el-table :data="generatedList" style="width: 100%" v-loading="loadingGenerated">
      <el-table-column label="序号" width="150" type="index"></el-table-column>
      <el-table-column label="DynaR-ABC输出结果">
        <template #default="{ row }">
          <div v-if="row.testcase">
            <el-tag
              v-for="(testCase, index) in formatABCTestcase(row.testcase)"
              :key="index"
              effect="plain"
              class="mr-2 mb-2"
            >
              {{ testCase }}
            </el-tag>
          </div>
          <div v-else>
            <el-empty description="无测试用例" image-size="60" />
          </div>
        </template>
      </el-table-column>
      <el-table-column label="修改与删除" width="100">
        <template #default="{ row, $index }">
          <el-button
            :icon="Edit"
            type="primary"
            circle
            class="gradient-button"
            @click="onEdit(row, $index)"
            plain
          ></el-button>
          <el-button
            :icon="Delete"
            type="danger"
            circle
            class="gradient-button"
            @click="onDelete(row, $index)"
            plain
          ></el-button>
        </template>
      </el-table-column>
      <template #empty>
        <el-empty description="没有ABC数据"></el-empty>
      </template>
    </el-table>

    <!-- IQPSO表格 -->
    <el-table :data="iqpsoList" style="width: 100%" v-loading="loadingIqpso">
      <el-table-column label="序号" width="150" type="index"></el-table-column>
      <el-table-column label="iqpso输出结果">
        <template #default="{ row }">
          <div v-if="row.test_cases && row.test_cases.length">
            <el-tag
              v-for="(testCase, index) in row.test_cases"
              :key="index"
              effect="plain"
              class="mr-2 mb-2"
            >
              {{ testCase.join(', ') }}
            </el-tag>
          </div>
          <div v-else>
            <el-empty description="无测试用例" image-size="60" />
          </div>
        </template>
      </el-table-column>
      <el-table-column label="修改与删除" width="100">
        <template #default="{ row, $index }">
          <el-button
            :icon="Edit"
            type="primary"
            circle
            class="gradient-button"
            @click="onIqpsoEdit(row, $index)"
            plain
          ></el-button>
          <el-button
            :icon="Delete"
            type="danger"
            circle
            class="gradient-button"
            @click="onDelete(row, $index)"
            plain
          ></el-button>
        </template>
      </el-table-column>
      <template #empty>
        <el-empty description="没有IQPSO数据"></el-empty>
      </template>
    </el-table>

    <ChannelEdit ref="dialog" @success="onSuccess"></ChannelEdit>
  </PageContainer>
</template>

<style scoped>
.page {
  margin-top: 30px;
}
/* 为按钮创建渐变背景 */
.el-button.gradient-button {
  background-image: linear-gradient(to right, #6a11cb 0%, #2575fc 100%);
  color: white; /* 设置按钮文字颜色 */
  border: none; /* 移除边框 */
  padding: 12px; /* 可根据需要调整按钮的尺寸 */
}

/* 按钮悬停和激活状态下的样式 */
.el-button.gradient-button:hover,
.el-button.gradient-button:active {
  background-image: linear-gradient(to right, #5a0fba 0%, #1f6dfc 100%);
  transform: scale(0.98); /* 按钮点击时的缩放效果 */
  transition: transform 0.1s; /* 缩放效果的过渡 */
}
</style>
