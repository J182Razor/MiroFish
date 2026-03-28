<template>
  <div class="skeleton-loader">
    <div class="skeleton-header"></div>
    <div class="skeleton-content">
      <div class="skeleton-line"></div>
      <div class="skeleton-line short"></div>
      <div class="skeleton-line"></div>
    </div>
    <div class="skeleton-actions">
      <div class="skeleton-button"></div>
      <div class="skeleton-button small"></div>
    </div>
  </div>
</template>

<script setup>
import { onMounted, ref } from 'vue'

const isVisible = ref(true)

onMounted(() => {
  // Auto-hide after 3 seconds for demo purposes
  setTimeout(() => {
    isVisible.value = false
  }, 3000)
})
</script>

<style scoped>
.skeleton-loader {
  padding: 1rem;
  border: 1px solid #e2e8f0;
  border-radius: 0.5rem;
  background: #ffffff;
}

.skeleton-header {
  height: 1.5rem;
  background: linear-gradient(90deg, #f7fafc 25%, #edf2f7 50%, #f7fafc 75%);
  background-size: 200% 100%;
  animation: shimmer 1.5s infinite;
  border-radius: 0.25rem;
  margin-bottom: 1rem;
}

.skeleton-content {
  margin-bottom: 1rem;
}

.skeleton-line {
  height: 1rem;
  background: linear-gradient(90deg, #f7fafc 25%, #edf2f7 50%, #f7fafc 75%);
  background-size: 200% 100%;
  animation: shimmer 1.5s infinite;
  border-radius: 0.25rem;
  margin-bottom: 0.5rem;
}

.skeleton-line.short {
  width: 60%;
}

.skeleton-actions {
  display: flex;
  gap: 0.5rem;
}

.skeleton-button {
  height: 2.5rem;
  background: linear-gradient(90deg, #f7fafc 25%, #edf2f7 50%, #f7fafc 75%);
  background-size: 200% 100%;
  animation: shimmer 1.5s infinite;
  border-radius: 0.375rem;
  flex: 1;
}

.skeleton-button.small {
  flex: 0.5;
}

@keyframes shimmer {
  0% {
    background-position: -200% 0;
  }
  100% {
    background-position: 200% 0;
  }
}

/* Respect reduced motion preferences */
@media (prefers-reduced-motion: reduce) {
  .skeleton-header,
  .skeleton-line,
  .skeleton-button {
    animation: none;
    background: #edf2f7;
  }
}
</style>