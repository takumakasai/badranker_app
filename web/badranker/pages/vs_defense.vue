<template>
  <h1>防衛画面</h1>
  <div><p>結果の承認</p></div><br>

  <div v-for="p in unapproved_list?.payload" :key="p.id">
    <p>{{ `チャレンジャー：${p.challenger_name} vs 防衛者：${p.defender_name}`}}</p>
    <p>{{ `結果：${p.challenger_result_status}`}}</p>
    <p>{{ `承認：${p.defender_approval_status}`}}</p>
    <div><button @click="approve(p.id)">承認</button></div><br>
    <div><button @click="reject(p.id)">否認</button></div><br>
  </div>

  <div><button @click="$router.back()">戻る</button></div><br>
  <p>{{unapproved_list}}</p>
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
