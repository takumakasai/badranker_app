<template>
  <v-app-bar color="primary" prominent>
    <v-app-bar-nav-icon 
      variant="text"
      @click.stop="drawer = !drawer">
    </v-app-bar-nav-icon>
    <v-img
      src="@/assets/image/logo3.png"
      alt="Logo"
      class="logo"
      max-width="50"
    ></v-img>
    <v-app-bar-title>
      BadRanker
    </v-app-bar-title>
  </v-app-bar>
  <v-navigation-drawer v-model="drawer" temporary>
    <v-list nav>
      <v-list-item prepend-icon="mdi-view-dashboard" title="Home" value="home"></v-list-item>
      <v-list-item prepend-icon="mdi-forum" title="アカウント編集" value="about"></v-list-item>
      <v-list-item prepend-icon="mdi-forum" title="ログアウト" value="about"></v-list-item>
    </v-list>
  </v-navigation-drawer>
</template>

<script setup lang="ts">
import { ref } from 'vue'


const drawer = ref(false)
</script>