// @ts-check
import { defineConfig } from 'astro/config';

// https://astro.build/config
export default defineConfig({
  site: 'https://httpparam.me/',
  server: {
    host: true, // allow external hosts (0.0.0.0)
  },
  vite: {
    preview: {
      host: true,
      allowedHosts: ['httpparam.me', 'www.httpparam.me'],
    },
    server: {
      host: true,
    },
  },
});
