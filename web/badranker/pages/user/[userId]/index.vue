<template>
  <v-sheet class="mx-auto semi-transparent custom-sheet" width="95%" min-height="20em">
    <h1 class="text-center">{{ user?.payload.name }}</h1>
    <div v-if="user">
      <p>ランク：{{ user.payload.rank }}</p>
      <p>プレイスタイル：{{ user.payload.play_style }}</p>
      <p>
        <i class="mdi mdi-sword" style="color:black" /> オフェンス：{{user.payload.offense}}
        <v-progress-linear :model-value="user.payload.offense" max="10" color="red" height="10" />
      </p>
      <p>
        <i class="mdi mdi-shield" style="color:black" /> ディフェンス：{{ user.payload.defense }}
        <v-progress-linear :model-value="user.payload.defense" max="10" color="blue" height="10" />
      </p>
      <p>
        <i class="mdi mdi-shoe-sneaker" style="color:black" /> スピード：{{ user.payload.speed }}
        <v-progress-linear :model-value="user.payload.speed" max="10" color="green" height="10" />
      </p>
      <p>
        <i class="mdi mdi-scale-balance" style="color:black" /> スタビリティ：{{ user.payload.stability }}
        <v-progress-linear :model-value="user.payload.stability" max="10" color="purple" height="10" />
      </p>
      <p>スキル：{{ user.payload.special_skill }}</p>
      <p>説明：{{ 'せつめいせつめいせつめい' }}</p>
    </div>
  </v-sheet>
</template>

<script setup lang="ts">
  // ルートパラメータ取得
  const route = useRoute()
  const userId = route.params.userId

  const user = await useApi(`users/${userId}`)

</script>

<style>
</style>
