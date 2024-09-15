// import this after install `@mdi/font` package
import '@mdi/font/css/materialdesignicons.css'

import 'vuetify/styles'
import { createVuetify } from 'vuetify'
import { defineNuxtPlugin } from '#app'

export default defineNuxtPlugin((nuxtApp: any ) => {
  const vuetify = createVuetify({
    // ... your configuration
  })
  nuxtApp .vueApp.use(vuetify)
})


// export default createVuetify({
//   icons: {
//     defaultSet: 'mdi', // This is already the default value - only for display purposes
//   },
// })
