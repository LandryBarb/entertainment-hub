<script setup lang="ts">
import BaseButton from '../components/atoms/BaseButton.vue';

const onWatchDemo = () => {
  console.log('watch demo clicked');
};
</script>

<template>
  <main>
    <h1>Entertainement Hub</h1>

    <BaseButton label="Watch Demo Reel" @click="onWatchDemo" />
  </main>
</template>
