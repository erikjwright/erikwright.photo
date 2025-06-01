import { defineConfig } from 'astro/config';
import tailwind from '@astrojs/tailwind';
import cloudflare from '@astrojs/cloudflare';

export default defineConfig({
  integrations: [tailwind()],
  output: 'server',  // Required for SSR
  adapter: cloudflare({
    mode: 'directory',  // For Pages
  }),
  image: {
    domains: ['cdn.sanity.io'],
  },
});
