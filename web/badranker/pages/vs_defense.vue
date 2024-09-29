<template>
  <v-sheet class="mx-auto semi-transparent" width="80%" min-height="20em">
    <h1 class="text-center">防衛画面</h1>
    <div class="text-center"><p>結果の承認</p></div>
    <v-divider class="my-4"></v-divider>

    <div v-for="p in unapproved_list?.payload" :key="p.id" class="my-4">
      <p>{{ `チャレンジャー：${p.challenger_name} vs 防衛者：${p.defender_name}` }}</p>
      <p>{{ `結果：${p.challenger_result_status}` }}</p>
      <p>{{ `承認：${p.defender_approval_status}` }}</p>
      <div class="text-center">
        <v-btn @click="approve(p.id)" color="success" class="mx-2">承認</v-btn>
        <v-btn @click="reject(p.id)" color="error" class="mx-2">否認</v-btn>
      </div>
      <v-divider class="my-4"></v-divider>
    </div>

    <div class="text-center">
      <v-btn @click="$router.back()" color="secondary">戻る</v-btn>
    </div>
  </v-sheet>
</template>

<script setup lang="ts">
  const loginUser = useLoginUser()

  // ルーティング取得
  const router = useRouter()

  // API実行
  const unapproved_list = await useApi(`battles/unapproved_list?self_id=${loginUser.value.id}`)

  const approve = async (id: number) => {
    // 承認
    await useApiPost(
      `battles/approve`,
      'PATCH',
      {
        battle_id: id
      }
    )
    alert('結果を承認しました。')
    router.push('/rank')
  }

  const reject = async (id: number) => {
    // 否認
    await useApiPost(
      `battles/reject`,
      'PATCH',
      { 
        battle_id: id
      }
    )
    alert('結果を否認しました。対戦相手に確認をして、再度結果を送信してもらってください。')
    router.push('/rank')
  }
</script>

<style>
</style>
