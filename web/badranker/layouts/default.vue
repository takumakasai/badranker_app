<template>
  <v-app>
    <Header />
    <v-main>
      <v-container class="d-flex align-center justify-center fill-height">
        <slot />
      </v-container>
    </v-main>

    <Footer />
  </v-app>
</template>

<script setup lang="ts">
</script>