<template>
  <h1>ログアウト</h1>
  <div><button @click="$router.push('/')">ログイン画面へ</button></div><br>
  <p>{{data}}</p>
</template>

<script setup lang="ts">
  // API実行
  const data = await useApi('samples')

</script>

<style>
</style>
