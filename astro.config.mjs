// @ts-check
import { defineConfig } from 'astro/config';

// https://astro.build/config
export default defineConfig({
  site: 'https://x1xh.xyz',
  preview: { allowedHosts: true },
  vite: {
    define: {
      'import.meta.env.COMMIT_HASH': JSON.stringify(process.env.COMMIT_HASH || 'unknown'),
    },
  },
});
