<template>
  <v-footer class="" color="primary" app> <!-- app footerが固定になる -->
    (c) TekumaTech
  </v-footer>
</template>

<script setup lang="ts">
</script>

<style>
.fixed-footer {
  position: fixed; /* フッターを固定 */
  bottom: 0; /* 画面の下部に配置 */
  left: 0; /* 左端に配置 */
  width: 100%; /* 横幅を画面全体に広げる */
  z-index: 1000; /* 他の要素より前面に表示 */
}
</style>