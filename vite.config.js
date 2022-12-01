import { defineConfig } from 'vite'
import { readFileSync } from 'fs';
import { resolve } from 'path';
import RubyPlugin from 'vite-plugin-ruby'
import vue from '@vitejs/plugin-vue2'
import { dynamicBase } from 'vite-plugin-dynamic-base';
import legacy from '@vitejs/plugin-legacy';

const isProduction = process.env.NODE_ENV === 'production';
const shouldSkipViteLegacy = process.env.SKIP_VITE_LEGACY === 'true';

console.log('shouldntSkipViteLegacy', !shouldSkipViteLegacy)
console.log('env: isProduction', isProduction)

// @vitejs/plugin-legacy is ignoring the browserslist config, so we need to explicit set targets
const browserslistTargets = readFileSync(resolve(__dirname, '.browserslistrc'), 'utf8')
  .split('\n')
  .filter(Boolean)
  .filter((line) => !line.startsWith('#'));

// Set asset host to vite ruby
process.env.CUSTOM_VITE_ASSET_HOST ? process.env.VITE_RUBY_ASSET_HOST = process.env.CUSTOM_VITE_ASSET_HOST : null;

console.log(browserslistTargets);

export default defineConfig({
  plugins: [
    // splitVendorChunkPlugin({}),
    RubyPlugin(),
    vue(),
    !shouldSkipViteLegacy && legacy({
      renderLegacyChunks: true,
      targets: browserslistTargets,
      additionalLegacyPolyfills: [
        'core-js/proposals/global-this',
        'regenerator-runtime/runtime',
      ],
    }),
    isProduction && dynamicBase({
      publicPath: 'window.__dynamic_base__',
      transformIndexHtml:  false
    })
  ],
  build: {
    rollupOptions: {
      experimentalCacheExpiry: 10,
      output: {
        // Force chunks to tests with multiple chunks
        manualChunks: {
          'pdfjs-dist/legacy/build/pdf.worker.min': ['pdfjs-dist/legacy/build/pdf.worker.min'],
          'Counter': ['app/javascript/components/Counter.vue'],
          'Page': ['app/javascript/views/Page.vue'],
          'Layout': ['app/javascript/views/Layout.vue']
        }
      }
    },
    sourcemap: process.env.NODE_ENV !== 'test',
    target: ['chrome63', 'edge79', 'firefox67', 'safari11.1'],
  },
  resolve: {
    alias: {
      // As tavola alias
      '@views': resolve(__dirname, 'app/javascript/views'),
    },
  },
})
