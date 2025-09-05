<script setup>
import PageContainer from '@/components/PageContainer.vue'
import { ref, computed } from 'vue'
import c1 from '@/assets/c1.png'
import c2 from '@/assets/c2.png'
import c3 from '@/assets/c3.png'
import c4 from '@/assets/c4.png'
import c5 from '@/assets/c5.png'
import ch1 from '@/assets/ch1.png'
import ch2 from '@/assets/ch2.png'
import m1 from '@/assets/m1.png'
import m2 from '@/assets/m2.png'
import p1 from '@/assets/p1.png'
import p2 from '@/assets/p2.png'
import s1 from '@/assets/s1.png'
import s2 from '@/assets/s2.png'
import sa1 from '@/assets/sa1.png'
import sa2 from '@/assets/sa2.png'
import w1 from '@/assets/w1.png'
import w2 from '@/assets/w2.png'
const helpModules = ref([
  {
    id: 1,
    title: 'Calculations模块',
    description:
      '在本模块中，用户可以点击右上角添加数据来生成自己的测试样例。三种算法均可使用。在成功生成测试样例后，用户可以在此页面查看输出结果。并可以查看输入数据和删除该样例',
    images: [c1, c2, c3, c4, c5],
    imageAlt: '测试用例生成界面示例'
  },
  {
    id: 2,
    title: 'Statistics Generator模块',
    description:
      '在本模块中，用户可以查看测试结果的统计分析。可以查看每个测试样例的输入数据和输出结果，并可以查看每个测试样例的统计信息。',
    images: [s1, s2],
    imageAlt: '测试结果分析界面示例'
  },
  {
    id: 3,
    title: 'Charts Generator模块',
    description:
      '在本模块中，用户可以查看测试结果的图表分析。可以查看每个测试样例的输入数据和输出结果，并可以查看每个测试样例的图表信息。',
    images: [ch1, ch2],
    imageAlt: '测试历史记录界面示例'
  },
  {
    id: 4,
    title: 'Webapi Testation模块',
    description:
      '本模块专注于针对于寻常网页的API接口，测试其功能是否可以正常运行同时测试不同API之间的交互作用是否可能导致程序运行错误，在输出内容中，最下面是每一组操作的执行结果，发现执行错误后向上回溯找到对应测试用例查看其操作可以找到对应出错的问题进行纠正修改。',
    images: [w1, w2],
    imageAlt: '系统设置界面示例'
  },
  {
    id: 5,
    title: 'DNN Picture模块',
    description:
      '本模块专注于对于图像分类器的解释与测试，用户首先将已输入模型的图片输入该模块，该模块可以返回一系列处理后图片，用户需将处理后图片下载至本地，将这些图片重新输入到模型中，观察模型的预测结果，处理的图片在原有图片的某些位置进行删去，通过观察一系列的图片预测结果，可以判断模型是通过什么特征来确定该物体，从而实现对模型的解释以及测试。',
    images: [p1, p2],
    imageAlt: '测试历史记录界面示例'
  },
  {
    id: 6,
    title: 'Model模块',
    description:
      '本模块专注于对于大模型的鲁棒性测试，旨在解决目前高质量指令集短缺问题，可以将输入的指令进行变异，输出一系列语义类似的指令集，这些指令集可以用作对模型鲁棒性的测试，也可以放回增加数据集的多样性。',
    images: [m1, m2],
    imageAlt: '测试历史记录界面示例'
  },
  {
    id: 7,
    title: 'Safety模块',
    description: '本模块专注于对于大模型安全中越狱指令的高质量生成，目前仍在开发中。',
    images: [sa1, sa2],
    imageAlt: '测试历史记录界面示例'
  }
])

const currentModuleIndex = ref(3)
const currentImageIndex = ref(0)

const switchModule = (index) => {
  currentModuleIndex.value = index
  currentImageIndex.value = 0
  const imageContainer = document.querySelector('.image-container')
  if (imageContainer) {
    imageContainer.classList.add('fade-animation')
    setTimeout(() => {
      imageContainer.classList.remove('fade-animation')
    }, 500)
  }
}

const switchImage = (index) => {
  currentImageIndex.value = index
}

const currentModule = computed(() => helpModules.value[currentModuleIndex.value])
const currentImage = computed(() => currentModule.value.images[currentImageIndex.value])
</script>

<template>
  <PageContainer :title="'帮助文档'" class="page-container">
    <div class="help-content" style="width: 80%; margin: 0 auto">
      <div class="image-container mb-10">
        <img
          :src="currentImage"
          :alt="currentModule.imageAlt"
          style="width: 100%; height: auto; display: block"
        />
      </div>
      <div class="dots mb-4">
        <span
          v-for="(image, index) in currentModule.images"
          :key="index"
          :class="{ active: index === currentImageIndex.value }"
          class="dot"
          @click="switchImage(index)"
        ></span>
      </div>
      <h3 class="text-xl font-bold mb-2">{{ currentModule.title }}</h3>
      <p class="mb-4">{{ currentModule.description }}</p>
      <div class="module-buttons">
        <button
          v-for="(module, index) in helpModules"
          :key="module.id"
          :class="{ active: index === currentModuleIndex.value }"
          class="module-buttons-btn"
          @click="switchModule(index)"
        >
          {{ module.title }}
        </button>
      </div>
    </div>
  </PageContainer>
</template>

<style scoped>
.page-container {
  /* 若 PageContainer 有默认样式影响，可在这里补充调整 */
}
.help-content {
  /* 可进一步完善样式，比如设置内边距等 */
}
.image-container {
  /* 图片容器样式，可根据需求调整 */
}
.module-buttons .module-buttons-btn {
  margin: 2.5px;
  padding: 8px 15px; /* 增加内边距 */
  border: 1px solid rgba(255, 255, 255, 0.1); /* 半透明边框 */
  background: rgba(255, 255, 255, 0.05); /* 半透明背景 */
  color: rgba(255, 255, 255, 0.8); /* 文字颜色 */
  cursor: pointer;
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1); /* 平滑过渡 */
  border-radius: 8px; /* 圆角 */
  min-height: 40px; /* 最小高度 */
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
  overflow: hidden;
}

/* 按钮悬停效果 */
.module-buttons .module-buttons-btn:hover {
  background: rgba(255, 255, 255, 0.08);
  transform: translateY(-3px);
  box-shadow: 0 6px 16px rgba(0, 0, 0, 0.25);
}

/* 修改选中状态样式 - 应用渐变背景和阴影 */
.module-buttons .module-buttons-btn.active {
  background: linear-gradient(135deg, #409eff, #3375ff) !important;
  color: white !important;
  border-color: rgba(255, 255, 255, 0.2) !important;
  box-shadow: 0 8px 24px rgba(64, 158, 255, 0.3) !important;
  transform: translateY(-2px);
}

/* 选中状态的悬停效果 */
.module-buttons .module-buttons-btn.active:hover {
  box-shadow: 0 10px 28px rgba(64, 158, 255, 0.4) !important;
  transform: translateY(-4px);
}

/* 添加光效动画 */
.module-buttons .module-buttons-btn::before {
  content: '';
  position: absolute;
  top: 0;
  left: -100%;
  width: 100%;
  height: 100%;
  background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.1), transparent);
  transition: all 0.6s ease;
}

.module-buttons .module-buttons-btn:hover::before {
  left: 100%;
}

/* 其他原有样式保持不变 */
.fade-animation {
  opacity: 0.7;
  transform: scale(0.99);
}
.module-buttons {
  display: flex;
  flex-wrap: wrap;
}
.dots {
  margin-bottom: 10px;
}
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  cursor: pointer;
}
.dot.active {
  background-color: #717171;
}
</style>
