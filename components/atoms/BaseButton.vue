<script lang="ts" setup>
type Variant = 'primary' | 'secondary';

const props = defineProps<{
  label: string;
  variant?: Variant;
}>();

const emit = defineEmits<{
  (e: 'click'): void;
}>();

const onClick = () => {
  emit('click');
};
</script>

<template>
  <button
    class="base-button"
    :data-variant="variant || 'primary'"
    @click="onClick"
  ></button>
</template>
<style scoped>
.base-button {
  padding: 0.75rem 1.25rem;
  border-radius: 999px;
  border: none;
  font-weight: 600;
  cursor: pointer;
}
</style>
