import vuetify, { transformAssetUrls } from 'vite-plugin-vuetify'
export default defineNuxtConfig({
  //...
  build: {
    transpile: ['vuetify'],
  },
  modules: [
    (_options, nuxt) => {
      nuxt.hooks.hook('vite:extendConfig', (config) => {
        // @ts-expect-error
        config.plugins.push(vuetify({ autoImport: true }))
      })
    },
    //...
  ],
  vite: {
    vue: {
      template: {
        transformAssetUrls,
      },
    },
  },
  plugins: [
    '~/plugins/vuetify.ts',
  ],
  css: [
    '@/assets/style.css'
    // '//web/badranker/assets/style.css'
  ],
  server: {
    port: 10000, // デフォルトのポートを設定
    host: '0.0.0.0' // すべてのネットワークインターフェースでリッスン
  }
})
