<script setup>
import { ref, computed } from 'vue';
import { userGetFormService } from '@/api/user';
import { getGeneratedTestcasesService } from '@/api/user';
import { getIqpsoService } from '@/api/user';
import PageContainer from '@/components/PageContainer.vue';
import { Search, Loading} from '@element-plus/icons-vue';
import { saveAs } from 'file-saver';
import * as XLSX from 'xlsx';

// 初始化响应式数据
const list = ref({});
const loading = ref(false);
const isnsubmit = ref(true);
const id = ref('');
const algorithmType = ref('PSO');

// 提交表单触发的函数
const Submit = async () => {
  if (!id.value) return;
  
  try {
    loading.value = true;
    let response;
    
    switch (algorithmType.value) {
      case 'PSO':
        response = await userGetFormService();
        break;
      case 'ABC':
        response = await getGeneratedTestcasesService();
        break;
      case 'IQPSO':
        response = await getIqpsoService(); 
        break;
      default:
        return;
    }

    if (response && response.data) {
      const rawData = response.data;
      
      if (algorithmType.value === 'PSO') {
        console.log("PSO原始数据:", rawData);
        
        // PSO处理逻辑
        const psoData = rawData.data;
        const recordIndex = parseInt(id.value) - 1;
        
        if (recordIndex < 0 || recordIndex >= psoData.length) {
          console.warn(`ID ${id.value} 超出PSO记录范围 (1-${psoData.length})`);
          return;
        }
        
        const record = psoData[recordIndex];
        console.log("找到的PSO记录:", record);
        
        list.value = record;
      } 
      else if (algorithmType.value === 'ABC') {
        console.log("ABC原始数据:", rawData);
        
        // ABC处理逻辑
        const abcData = rawData.data;
        const recordIndex = parseInt(id.value) - 1;
        
        if (recordIndex < 0 || recordIndex >= abcData.length) {
          console.warn(`ID ${id.value} 超出ABC记录范围 (1-${abcData.length})`);
          return;
        }
        
        const record = abcData[recordIndex];
        console.log("找到的ABC记录:", record);
        
        list.value = {
          num: record.param_count,
          result: record.testcase
        };
      }
      else if (algorithmType.value === 'IQPSO') {
        console.log("IQPSO原始数据:", rawData);
        
        // IQPSO处理逻辑
        const recordId = parseInt(id.value);
        const iqpsoRecord = rawData.find(item => item.id === recordId);
        
        if (!iqpsoRecord) {
          console.warn(`未找到ID为 ${id.value} 的IQPSO记录`);
          return;
        }
        
        console.log("找到的IQPSO记录:", iqpsoRecord);
        
        // 检查测试用例数据
        if (!iqpsoRecord.test_cases || iqpsoRecord.test_cases.length === 0) {
          console.warn(`ID为 ${id.value} 的记录没有测试用例数据`);
          return;
        }
        
        // 检查测试用例格式
        if (!Array.isArray(iqpsoRecord.test_cases[0])) {
          console.warn(`测试用例格式错误`, iqpsoRecord.test_cases);
          return;
        }
        
        // 转换数据格式为统一结构
        const formattedResult = iqpsoRecord.test_cases
          .map(testCase => testCase.join(',') + '|')
          .join('');
        
        console.log("转换后字符串:", formattedResult);
        
        list.value = {
          num: iqpsoRecord.test_cases[0].length,
          result: formattedResult,
          parameters: iqpsoRecord.parameters || {}
        };
      }
    }
  } catch (error) {
    console.error('请求出错:', error);
  } finally {
    loading.value = false;
    isnsubmit.value = false;
  }
};

// 计算表格数据
const tableData = computed(() => {
  if (!list.value?.result) return [];
  
  // 统一分隔符处理
  let rowSep, paramSep;
  
  switch (algorithmType.value) {
    case 'PSO':
      rowSep = ';';
      paramSep = ' ';
      break;
    case 'ABC':
    case 'IQPSO':
      rowSep = '|';
      paramSep = ',';
      break;
    default:
      rowSep = ';';
      paramSep = ' ';
  }
  
  return list.value.result
    .split(rowSep)
    .filter(row => row.trim())
    .map(row => {
      // 拆分每个参数的值
      const paramValues = row.split(paramSep)
        .filter(value => value.trim());
      
      // 创建行对象，每个值单独一列
      const rowObject = {};
      paramValues.forEach((value, index) => {
        rowObject[`参数${index + 1}`] = value;
      });
      
      return rowObject;
    });
});

// 导出数据到 Excel 的函数
const exportToExcel = () => {
  if (tableData.value.length === 0) {
    ElMessage.warning('没有可导出的数据');
    return;
  }

  // 创建表头
  const headers = Array.from({ length: list.value.num }, (_, i) => `参数${i + 1}`);

  // 转换数据为二维数组
  const data = [
    headers,
    ...tableData.value.map(item =>
      headers.map(header => item[header])
    )
  ];

  const worksheet = XLSX.utils.aoa_to_sheet(data);
  const workbook = XLSX.utils.book_new();
  XLSX.utils.book_append_sheet(workbook, worksheet, '测试数据');

  const excelBuffer = XLSX.write(workbook, {
    bookType: 'xlsx',
    type: 'array'
  });

  const blob = new Blob([excelBuffer], {
    type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
  });
  const filename = `${algorithmType.value}_${id.value}_${new Date().toISOString().slice(0, 10)}.xlsx`;
  saveAs(blob, filename);
};

</script>

<template>
  <PageContainer :title="isnsubmit ? '统计图表生成' : '算法执行结果'" class="page-container">
    <template v-if="isnsubmit">
      <el-card class="form-card" shadow="hover">
        <div class="form-header">
          <h2 class="form-title">请输入序号生成结果表</h2>
          <p class="form-subtitle">Please enter the serial number to generate the result table</p>
        </div>

        <el-form @submit.prevent="Submit">
          <!-- 选择算法类型 -->
          <el-form-item label="算法类型" required>
            <el-select v-model="algorithmType" size="large" style="width: 100%">
              <el-option label="粒子群优化算法 (dbniche - pso)" value="PSO" />
              <el-option label="人工蜂群算法 (DynaR - ABC)" value="ABC" />
              <el-option label="改进量子行为粒子群优化算法 (IQPSO)" value="IQPSO" />
            </el-select>
          </el-form-item>

          <!-- 输入测试序号 -->
          <el-form-item label="测试序号" required>
            <el-input
              v-model="id"
              placeholder="请输入测试序号"
              size="large"
              :prefix-icon="Search"
              clearable
              type="number"
            >
              <template #suffix>
                <el-tag type="info">当前版本: 1.2.0</el-tag>
              </template>
            </el-input>
          </el-form-item>

          <!-- 提交按钮 -->
          <el-button
            type="primary"
            size="large"
            native-type="submit"
            :loading="loading"
            class="submit-btn"
          >
            <template #loading>
              <el-icon class="is-loading"><Loading /></el-icon>
              数据加载中...
            </template>
            <span v-if="!loading">立即生成</span>
          </el-button>
        </el-form>
      </el-card>
    </template>

    <template v-else>
      <el-card shadow="never" class="result-card">
        <template #header>
          <div class="result-header">
            <!-- 显示算法类型标签 -->
            <el-tag
              :type="algorithmType === 'PSO' ? 'success' : algorithmType === 'ABC' ? 'warning' : 'info'"
              effect="dark"
              size="large"
            >
              {{ algorithmType }} 算法执行结果
            </el-tag>
            <div class="meta-info">
              <span class="timestamp">生成时间: {{ new Date().toLocaleString() }}</span>
              <el-tooltip content="返回输入界面" placement="top">
                <el-button circle @click="isnsubmit = true">
                  <el-icon><Refresh /></el-icon>
                </el-button>
              </el-tooltip>
            </div>
          </div>
        </template>

        <!-- 显示表格数据 -->
        <el-table
          :data="tableData"
          border
          stripe
          highlight-current-row
          height="560px"
          class="data-table"
        >
          <el-table-column
            v-for="n in list.num"
            :key="n"
            :prop="`参数${n}`"
            :label="`参数 ${n}`"
            min-width="120"
            align="center"
            header-align="center"
          >
            <template #header="{ column }">
              <div class="table-header">
                <el-icon><Operation /></el-icon>
                <span>{{ column.label }}</span>
              </div>
            </template>
          </el-table-column>

          <template #empty>
            <el-empty description="暂无数据" :image-size="160" />
          </template>
        </el-table>

        <!-- 表格底部操作 -->
        <div class="table-footer">
          <el-pagination
            :page-size="10"
            layout="total, prev, pager, next"
            :total="tableData.length"
          />
          <el-button
            type="primary"
            plain
            @click="exportToExcel"
            :disabled="tableData.length === 0"
          >
            导出EXCEL
          </el-button>
        </div>
      </el-card>
    </template>
  </PageContainer>
</template>

<style lang="scss" scoped>
.page-container {
  min-height: 100vh;
  padding: 24px;
}

.form-card {
  max-width: 680px;
  margin: 40px auto;
  border-radius: 12px;

  .form-header {
    text-align: center;
    margin-bottom: 32px;

    .form-title {
      font-size: 24px;
      color: #d9dbdf;
      margin-bottom: 8px;
    }

    .form-subtitle {
      font-size: 14px;
      color: #909399;
    }
  }

  :deep(.el-input__wrapper) {
    border-radius: 8px;
    padding: 0 16px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
  }

  .submit-btn {
    width: 100%;
    margin-top: 24px;
    font-weight: 500;
    letter-spacing: 1px;
  }
}

.result-card {
  border-radius: 12px;

  .result-header {
    display: flex;
    justify-content: space-between;
    align-items: center;

    .meta-info {
      display: flex;
      align-items: center;
      gap: 16px;

      .timestamp {
        color: #909399;
        font-size: 14px;
      }
    }
  }

  .data-table {
    margin: 16px 0;

    :deep(.el-table__header) {
      th {
        background: #f5f7fa;
        font-weight: 600;
      }
    }

    .table-header {
      display: flex;
      align-items: center;
      gap: 8px;
    }
  }

  .table-footer {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 24px;
    padding-top: 16px;
    border-top: 1px solid #ebeef5;
  }
}

// 动画效果
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
</style>