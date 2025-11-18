<script setup lang="ts">
const brandStore = useBrandStore();

onMounted(() => {
  brandStore.fetchBrands();
});
</script>

<template>
  <div>
    <h1>Brand Test Page</h1>

    <div v-if="brandStore.loading">Loading...</div>

    <div v-if="brandStore.error">
      <strong>Error:</strong> {{ brandStore.error }}
    </div>

    <ul>
      <li v-for="b in brandStore.brands" :key="b.id">
        {{ b.name }} — {{ b.industry }}
      </li>
    </ul>
  </div>
</template>
