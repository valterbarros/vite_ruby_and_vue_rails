import { defineConfig } from 'vite'
import { resolve } from 'path';
import RubyPlugin from 'vite-plugin-ruby'
import vue from '@vitejs/plugin-vue'
import { splitVendorChunkPlugin } from 'vite'

const isProduction = process.env.NODE_ENV === 'production';
// Set asset host to vite ruby
process.env.CUSTOM_VITE_ASSET_HOST ? process.env.VITE_RUBY_ASSET_HOST = process.env.CUSTOM_VITE_ASSET_HOST : null;

export default defineConfig({
  // base: '/vite',
  plugins: [
    // splitVendorChunkPlugin({}),
    RubyPlugin(),
    vue(),
  ],
  build: {
    rollupOptions: {
      experimentalCacheExpiry: 1,
      output: {
        // Force chunks to tests with multiple chunks
        manualChunks: {
          'pdfjs-dist/legacy/build/pdf.worker.min': ['pdfjs-dist/legacy/build/pdf.worker.min'],
          'Counter': ['app/javascript/components/Counter.vue'],
          'Layout': ['app/javascript/views/Layout.vue']
        }
      }
    }
  },
  resolve: {
    alias: {
      // As tavola alias
      '@views': resolve(__dirname, 'app/javascript/views'),
    },
  },
})
