import { defineNuxtPlugin } from 'nuxt/app';
import type { NuxtApp } from 'nuxt/app';
import { createPinia } from 'pinia';

export default defineNuxtPlugin((nuxtApp: NuxtApp) => {
  const pinia = createPinia();
  nuxtApp.vueApp.use(pinia);
});
