import { defineConfig } from 'vite'
import RubyPlugin from 'vite-plugin-ruby'
import vue from '@vitejs/plugin-vue'
import { splitVendorChunkPlugin } from 'vite'

export default defineConfig({
  // base: 'http://127.0.0.1:4000',
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
  }
})
