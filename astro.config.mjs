// @ts-check
import { defineConfig } from 'astro/config';

// https://astro.build/config
export default defineConfig({
  site: 'https://httpparam.me/',
  vite: {
    preview: {
      host: true,
      allowedHosts: ['httpparam.me'],
    },
  },
});
