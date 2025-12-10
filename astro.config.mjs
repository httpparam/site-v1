// @ts-check
import { defineConfig } from 'astro/config';

// https://astro.build/config
export default defineConfig({
  server: {
    host: true, // allow external hosts (0.0.0.0)
  },
  vite: {
    preview: {
      allowedHosts: ['httpparam.me', 'www.httpparam.me'],
    },
  },
});
