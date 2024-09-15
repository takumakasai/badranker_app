<template>
  <h1>挑戦画面</h1>
  <div>
    {{ `対戦相手：${user.payload.rank}位: ${user.payload.name} (${user.payload.email})`}}
  </div>

  <div>
    <button @click="onStart" :disabled="status==StatusType.PLAYING">開始</button>
  </div>

  <div v-if="status==StatusType.PLAYING">
    <button @click="onWin">勝ち</button>
    <button @click="onLose">負け</button>
  </div>

  <br>
  <div><button @click="$router.back()">戻る</button></div>
  <br>
  <p>{{user}}</p>

</template>

<script setup lang="ts">
import { RESULT_STATUS } from '~/const/enum'


  // 定数
  enum Status {
    READY = '0',
    PLAYING = '1',
  }
  const status = ref(Status.READY)
  const StatusType = ref(Status)

  // ルートパラメータ取得
  const route = useRoute()
  const vsId = route.params.vsId

  // ルーティング取得
  const router = useRouter()

  // ログインユーザー情報取得
  const loginUser = useLoginUser()

  // API実行
  const user = await useApi(`users/vs_challenge?id=${vsId}`)

  const onStart = () => {
    status.value = Status.PLAYING
  }

  const onWin = async () => {
    // ランクの更新
    await useApiPost(
      `battles/battle`,
      'POST',
      { 
        opponent_id: vsId, // 対戦相手のID
        self_id: loginUser.value.id, // ログインユーザーのIDを取得する
        result_status: RESULT_STATUS.WIN, // 
        
      }
    )
    alert('おめでとう。相手の承認を待つがよい。')

    // // ログインユーザー情報を再取得
    // const res = await useApi('users/' + loginUser.value.id)
    // // ログイン情報をステートにセット
    // loginUser.value.id = res.value.payload.id
    // loginUser.value.name = res.value.payload.name
    // loginUser.value.email = res.value.payload.email
    // loginUser.value.rank = res.value.payload.rank
    // loginUser.value.status = res.value.payload.status

    router.push('/rank')
  }


  //   // ランクの更新
  //   await useApiPost(
  //     `users/update_rank`,
  //     'PATCH',
  //     { 
  //       opponent_id: vsId, // 対戦相手のID
  //       self_id: loginUser.value.id, // FIXME: ログインユーザーのIDを取得する
  //     }
  //   )
  //   alert('おめでとう。ランクアップしました。')

  //   // ログインユーザー情報を再取得
  //   const res = await useApi('users/' + loginUser.value.id)
  //   // ログイン情報をステートにセット
  //   loginUser.value.id = res.value.payload.id
  //   loginUser.value.name = res.value.payload.name
  //   loginUser.value.email = res.value.payload.email
  //   loginUser.value.rank = res.value.payload.rank
  //   loginUser.value.status = res.value.payload.status

  //   router.push('/rank')
  // }

  const onLose = () => {
    alert('残念')
    
  }

</script>

<style>
</style>
