<template>
  <v-sheet class="mx-auto semi-transparent" width="50%" min-height="20em">
    <h1 class="text-center">挑戦画面</h1>
    <div class="text-center">
      <p>{{ `対戦相手：${user.payload.rank}位: ${user.payload.name} (${user.payload.email})` }}</p>
    </div>
    <div class="text-center">
      <v-btn @click="onStart" :disabled="status == StatusType.PLAYING" color="primary">開始</v-btn>
    </div>
    <div v-if="status == StatusType.PLAYING" class="text-center mt-4">
      <v-btn @click="onWin" color="success">勝ち</v-btn>
      <v-btn @click="onLose" color="error" class="ml-2">負け</v-btn>
    </div>
    <v-divider class="my-4"></v-divider>
    <div class="text-center">
      <v-btn @click="$router.back()" color="secondary">戻る</v-btn>
    </div>
  </v-sheet>
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
