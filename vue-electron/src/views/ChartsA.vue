<script setup>
import { ref, onMounted, onUnmounted } from 'vue'
import { userGetFormService } from '@/api/user'
import { getGeneratedTestcasesService } from '@/api/user'
import { getIqpsoService } from '@/api/user'
import * as echarts from 'echarts'
import { Search } from '@element-plus/icons-vue'

const fakerate = 5
const id0 = ref()
const id = ref()
const test = ref()
const max = ref()
const min = ref()
const combinations = ref()
const time = ref()
const rate = ref()
const data = ref()
const strength = ref()
const chartInstance = ref(null) // 用于存储图表实例
const algorithmType = ref('PSO')

const getdata = async () => {
  id.value = id0.value - 1

  try {
    let response

    if (algorithmType.value === 'PSO') {
      response = await userGetFormService()
    } else if (algorithmType.value === 'ABC') {
      response = await getGeneratedTestcasesService()
    } else {
      return
    }

    if (response && response.data) {
      const rawData = response.data

      if (algorithmType.value === 'PSO') {
        // 原有的PSO处理逻辑
        const psoData = rawData.data
        if (id.value < 0 || id.value >= psoData.length) {
          console.warn(`ID ${id0.value} 超出PSO记录范围 (1-${psoData.length})`)
          return
        }

        const record = psoData[id.value]
        test.value = record.testcasenum
        combinations.value = record.coverednum
        time.value = record.times
        rate.value = record.coveragerate
        strength.value = record.strength

        // 解析参数
        const numbers = record.parameter.split(',').map(Number)
        max.value = Math.max(...numbers)
        min.value = Math.min(...numbers)

        // 初始化图表
        const rateValues = rate.value.split(' ').map((value) => parseFloat(value.replace('%', '')))
        initChart(rateValues)
      } else if (algorithmType.value === 'ABC') {
        // ABC专用处理逻辑
        const abcData = rawData.data
        if (id.value < 0 || id.value >= abcData.length) {
          console.warn(`ID ${id0.value} 超出ABC记录范围 (1-${abcData.length})`)
          return
        }

        const record = abcData[id.value]
        test.value = record.testcase.split('|').filter(Boolean).length
        combinations.value = test.value // ABC没有覆盖组合数，使用测试用例数代替
        time.value = record.time
        rate.value = record.coverage.replace(/\|/g, ' ') // 将|替换为空格
        strength.value = record.strength

        // 解析参数
        if (record.param_values) {
          const numbers = record.param_values.split(',').map(Number)
          max.value = Math.max(...numbers)
          min.value = Math.min(...numbers)
        } else {
          max.value = 0
          min.value = 0
        }

        // 初始化图表
        const rateValues = rate.value.split(' ').map((value) => parseFloat(value.replace('%', '')))
        initChart(rateValues)
      }
    }
  } catch (error) {
    console.error('获取数据失败:', error)
  }
}

const initChart = (rateValues) => {
  const chartDom = document.querySelector('.graph')
  chartInstance.value = echarts.init(chartDom)

  const option = {
    // 优化图表样式
    grid: {
      left: '3%',
      right: '4%',
      bottom: '10%',
      containLabel: true
    },
    xAxis: {
      type: 'category',
      axisLine: {
        lineStyle: {
          color: '#606266'
        }
      }
    },
    yAxis: {
      type: 'value',
      axisLabel: {
        formatter: '{value}%'
      },
      axisLine: {
        lineStyle: {
          color: '#606266'
        }
      }
    },
    series: [
      {
        data: rateValues,
        type: 'line',
        smooth: true,
        lineStyle: {
          color: '#409EFF',
          width: 2
        },
        itemStyle: {
          color: '#409EFF'
        },
        areaStyle: {
          color: {
            type: 'linear',
            x: 0,
            y: 0,
            x2: 0,
            y2: 1,
            colorStops: [
              {
                offset: 0,
                color: 'rgba(64,158,255,0.4)'
              },
              {
                offset: 1,
                color: 'rgba(64,158,255,0.05)'
              }
            ]
          }
        }
      }
    ]
  }

  chartInstance.value.setOption(option)
}

// 确保在组件销毁时释放图表实例
onUnmounted(() => {
  if (chartInstance.value !== null) {
    chartInstance.value.dispose()
  }
})
const isnsubmit = ref(1)
const Submit = () => {
  isnsubmit.value = 0
  getdata()
}
</script>

<template>
  <el-card class="box-card" shadow="hover">
    <template #header>
      <div class="flex justify-between items-center">
        <h2 class="!m-0 text-xl font-semibold">算法细节</h2>
        <el-tag :type="algorithmType === 'PSO' ? 'info' : 'warning'" size="large">
          {{ algorithmType === 'PSO' ? 'PSO' : 'ABC' }} Algorithm
        </el-tag>
      </div>
    </template>

    <div v-if="isnsubmit" class="flex justify-center py-12">
      <el-card class="form-card" shadow="never">
        <template #header>
          <div class="text-center">
            <h3 class="!m-0 text-lg font-medium text-gray-800">请输入序号以生成结果表</h3>
            <p class="!m-0 mt-1 text-sm text-gray-500">
              Please enter the serial number to generate the result table.
            </p>
          </div>
        </template>

        <el-form @submit.prevent="Submit">
          <el-form-item label="算法类型" required>
            <el-select
              v-model="algorithmType"
              size="large"
              style="width: 100%"
              @change="isnsubmit = 1"
            >
              <el-option label="小生境粒子群算法 (dbniche-pso)" value="PSO" />
              <el-option label="人工蜂群算法 (DynaR-ABC)" value="ABC" />
            </el-select>
          </el-form-item>

          <el-form-item label="查询序号" required>
            <el-input
              v-model="id0"
              placeholder="请输入序号"
              size="large"
              :prefix-icon="Search"
              clearableS
            />
          </el-form-item>

          <div class="text-center">
            <el-button
              type="primary"
              size="large"
              native-type="submit"
              :loading="isLoading"
              class="w-full"
            >
              {{ isLoading ? '生成中...' : '生成报告' }}
            </el-button>
          </div>
        </el-form>
      </el-card>
    </div>

    <div v-else class="result-container">
      <!-- 数据概览卡片 -->
      <el-row :gutter="20" class="mb-6">
        <el-col :span="8">
          <el-statistic title="最大域尺寸" :value="max" class="dashboard-card">
            <template #suffix>
              <el-icon><Top /></el-icon>
            </template>
          </el-statistic>
        </el-col>
        <el-col :span="8">
          <el-statistic title="最小域尺寸" :value="min" class="dashboard-card">
            <template #suffix>
              <el-icon><Bottom /></el-icon>
            </template>
          </el-statistic>
        </el-col>
        <el-col :span="8">
          <el-statistic title="执行时间" :value="time" class="dashboard-card">
            <template #suffix>秒</template>
          </el-statistic>
        </el-col>
      </el-row>

      <!-- 详细信息面板 -->
      <el-card class="detail-card" shadow="never">
        <template #header>
          <div class="flex items-center gap-2">
            <el-icon><Document /></el-icon>
            <span class="text-lg font-semibold">算法执行详情</span>
          </div>
        </template>

        <el-descriptions :column="2" border>
          <el-descriptions-item label="算法类型">
            <el-tag :type="algorithmType === 'PSO' ? 'success' : 'warning'" effect="dark">
              {{ algorithmType === 'PSO' ? 'PSO' : 'ABC' }}
            </el-tag>
          </el-descriptions-item>
          <el-descriptions-item label="测试用例数">
            <el-progress
              :percentage="(test / combinations) * 100"
              :format="() => test"
              status="success"
              :stroke-width="16"
            />
          </el-descriptions-item>
          <el-descriptions-item label="覆盖组合数">
            <div class="flex items-center gap-2">
              <span>{{ combinations }}</span>
              <el-tooltip :content="`${strength}-way组合覆盖`">
                <el-icon><InfoFilled /></el-icon>
              </el-tooltip>
            </div>
          </el-descriptions-item>
          <el-descriptions-item label="覆盖率">
            <el-rate
              v-model="fakerate"
              disabled
              :colors="['#99A9BF', '#F7BA2A', '#FF9900']"
              :texts="['低', '中', '高']"
              show-text
            />
          </el-descriptions-item>
        </el-descriptions>
      </el-card>

      <!-- 图表展示 -->
      <el-card class="mt-6" shadow="never">
        <template #header>
          <div class="flex items-center gap-2">
            <el-icon><DataAnalysis /></el-icon>
            <span class="text-lg font-semibold">覆盖率趋势分析</span>
          </div>
        </template>

        <div class="graph" style="width: 100%; height: 400px"></div>

        <div class="mt-4 flex justify-end">
          <el-button type="info" size="small" @click="exportChart">
            <el-icon class="mr-1"><Download /></el-icon>
            导出图表
          </el-button>
        </div>
      </el-card>
    </div>
  </el-card>
</template>

<style scoped>
/* 增加标题和重要信息的字体颜色对比度 */
.text-xl,
.font-semibold,
.text-lg,
.font-medium,
.text-gray-800 {
  color: #eceff1 !important; /* 深色，提高对比度 */
}

/* 调整描述性文字的字体颜色 */
.text-gray-500 {
  color: #606c76 !important; /* 深灰色，提高对比度 */
}

/* 调整统计卡片头部和内容的颜色 */
.dashboard-card :deep(.el-statistic__head) {
  color: #4b5863 !important; /* 深灰色，提高对比度 */
}
.dashboard-card :deep(.el-statistic__content) {
  color: #2c3e50 !important; /* 深色，提高对比度 */
}

/* 调整详细卡片头部和标签颜色 */
.detail-card :deep(.el-card__header) {
  color: #2c3e50 !important; /* 深色，提高对比度 */
}

.detail-card :deep(.el-descriptions__label) {
  color: #808b94 !important; /* 深灰色，提高对比度 */
}

/* 调整按钮和图表标题颜色 */
.el-button,
.el-button--primary {
  color: #fff !important; /* 确保按钮文字颜色为白色 */
}

.el-card__header span {
  color: #4e5c69 !important; /* 深色，提高对比度 */
}

/* 调整图表X轴和Y轴字体颜色 */
.graph :deep(.el-axis) {
  color: #606c76 !important; /* 深灰色，提高对比度 */
}

.graph :deep(.el-axis .el-axis-line) {
  stroke: #606c76 !important; /* 深灰色，提高对比度 */
}

.graph :deep(.el-axis .el-axis-label) {
  color: #606c76 !important; /* 深灰色，提高对比度 */
}

/* 其他需要调整的文本颜色 */
/* 你可以根据需要添加更多的选择器来调整其他文本颜色 */
.box-card {
  width: 100%;
  max-width: 1200px; /* 限制最大宽度保持内容可读性 */
  min-height: 800px; /* 最小高度保证布局稳定性 */
  margin: 20px auto; /* 居中显示 */
  border-radius: 12px; /* 统一大圆角 */
  background: linear-gradient(to bottom, #030303, #2b2121); /* 从灰色到黑色的渐变 */
}

/* 表单卡片容器 */
.form-card {
  max-width: 800px; /* 优化表单显示宽度 */
  margin: 40px auto; /* 垂直间距+水平居中 */
  border-radius: 12px; /* 保持圆角统一 */

  /* 表单头部样式 */
  .form-header {
    text-align: center;
    margin-bottom: 32px;

    .form-title {
      font-size: 24px;
      color: #303133; /* 使用Element主文本色 */
      margin-bottom: 8px;
    }

    .form-subtitle {
      font-size: 14px;
      color: #909399; /* 使用Element次要文本色 */
    }
  }

  /* 输入框深度样式 */
  :deep(.el-input__wrapper) {
    border-radius: 8px;
    padding: 0 16px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05); /* 微阴影提升层次感 */
  }

  /* 提交按钮样式 */
  .submit-btn {
    width: 100%;
    margin-top: 24px;
    font-weight: 500; /* 中等字重 */
    letter-spacing: 1px; /* 字间距提升可读性 */
  }
}

/* 结果容器 */
.result-container {
  padding: 0 20px; /* 左右内边距 */
}

/* 数据概览卡片 */
.dashboard-card {
  background: #f8f9fc; /* 浅色背景 */
  border-radius: 12px;
  padding: 20px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.05); /* 柔和阴影 */

  /* 统计组件深度样式 */
  :deep(.el-statistic) {
    &__head {
      color: #606266; /* 灰色标题 */
      font-size: 14px;
      margin-bottom: 8px;
    }
    &__content {
      color: #303133; /* 深色数值 */
      font-size: 24px;
      font-weight: 600;
    }
  }
}

/* 详细信息面板 */
.detail-card {
  /* 面板头部样式 */
  :deep(.el-card__header) {
    background: linear-gradient(145deg, #f8fafc, #f1f5f9); /* 渐变背景 */
    border-bottom: none; /* 移除默认边框 */
  }

  /* 描述列表样式 */
  :deep(.el-descriptions) {
    &__label {
      width: 160px;
      background: #f8f9fb !important; /* 标签背景色 */
      font-weight: 500; /* 中等字重 */
    }
  }
}

/* 图表容器 */
.graph {
  background: #fff;
  border-radius: 8px;
  box-shadow:
    0 1px 2px rgba(0, 0, 0, 0.05),
    0 4px 6px -1px rgba(0, 0, 0, 0.05); /* 双层阴影增强层次 */
}

/* 通用卡片样式 */
.el-card {
  /* 头部样式 */
  &__header {
    border-bottom: 1px solid #ebeef5; /* 分割线 */
    padding: 16px 20px; /* 紧凑内边距 */
  }

  /* 内容区域 */
  &__body {
    padding: 20px;
  }
}

/* 表格底部工具栏 */
.table-footer {
  display: flex;
  justify-content: space-between; /* 两端对齐 */
  align-items: center;
  margin-top: 24px;
  padding-top: 16px;
  border-top: 1px solid #ebeef5; /* 顶部边框 */
}
</style>
