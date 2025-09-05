<script setup>
defineProps({
  title: {
    required: true,
    type: String
  }
})
</script>
<template>
  <el-card class="box-card" shadow="always">
    <template #header>
      <div class="header">
        <h2>{{ title }}</h2>
        <div class="extra">
          <slot name="extra"></slot>
        </div>
      </div>
    </template>
    <slot></slot>
  </el-card>
</template>

<style scoped>
.box-card {
  position: relative;
  min-height: 700px;
  box-sizing: border-box;
  background: linear-gradient(to bottom, #030303, #2b2121); /* 从灰色到黑色的渐变 */
  .header {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
}
</style>
