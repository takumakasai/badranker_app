<template>
  <v-app class="background-image">
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
<style scoped>
.background-image {
  background-image: url('../assets/image/background.jpg');
  background-size: cover;
  background-position: center;
}
</style>
