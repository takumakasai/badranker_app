import vuetify, { transformAssetUrls } from 'vite-plugin-vuetify'
export default defineNuxtConfig({
  //...
  app: {
    head: {
      link: [
        { rel: 'stylesheet', href: 'https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap' }
      ]
    }
  },
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
  runtimeConfig: {
    public:{
      // FIXME: 環境変数がうまく反映されないため直接記述
      // apiBaseUrl: process.env.API_BASE_URL || 'http://localhost:3000'
      apiBaseUrl: process.env.API_BASE_URL || 'https://badranker-app-api.onrender.com'
    }
  },
  plugins: [
    '~/plugins/vuetify.ts',
  ],
  css: [
    '@/assets/style.css'
    // '//web/badranker/assets/style.css'
  ]
})
