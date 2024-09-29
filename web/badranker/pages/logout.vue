<template>
  <v-sheet class="mx-auto semi-transparent" width="50%" min-height="20em">
    <h1 class="text-center">ログアウト</h1>
    <div class="text-center">
      <v-btn @click="$router.push('/')" color="primary">ログイン画面へ</v-btn>
    </div>
  </v-sheet>
</template>

<script setup lang="ts">
  // API実行
  const data = await useApi('samples')

</script>

<style>
</style>
