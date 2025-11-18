import { defineStore } from 'pinia';
import { useNuxtApp } from 'nuxt/app';
import { $fetch } from 'ofetch';

export interface Brand {
  id: string;
  name: string;
  industry?: string;
  summary?: string;
  userId: string;
  createdAt: string;
  updatedAt: string;
}

export const useBrandStore = defineStore('brand', {
  state: () => ({
    brands: [] as Brand[],
    currentBrand: null as Brand | null,
    loading: false,
    error: null as string | null,
  }),

  actions: {
    async fetchBrands() {
      this.loading = true;
      try {
        // const { $fetch } = useNuxtApp();
        const data = await $fetch<Brand[]>('/api/brands');
        this.brands = data;
      } catch (err: any) {
        this.error = err.message ?? 'Failed to fetch brands';
      } finally {
        this.loading = false;
      }
    },

    async fetchBrand(id: string) {
      this.loading = true;
      try {
        // const { $fetch } = useNuxtApp();
        const data = await $fetch<Brand>(`/api/brands/${id}`);
        this.currentBrand = data;
      } catch (err: any) {
        this.error = err.message ?? 'Failed to fetch brand';
      } finally {
        this.loading = false;
      }
    },

    async createBrand(payload: {
      name: string;
      industry?: string;
      summary?: string;
      userId: string;
    }) {
      this.loading = true;
      try {
        // const { $fetch } = useNuxtApp();
        const newBrand = await $fetch<Brand>('/api/brands', {
          method: 'POST',
          body: payload,
        });

        this.brands.push(newBrand);
        return newBrand;
      } catch (err: any) {
        this.error = err.message ?? 'Failed to create brand';
      } finally {
        this.loading = false;
      }
    },
  },
});
