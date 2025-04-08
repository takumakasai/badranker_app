<template>
  <v-sheet class="mx-auto semi-transparent custom-sheet" width="300" min-height="20em">
    <v-form fast-fail @submit.prevent>
      <v-text-field v-model="userDisplayId" label="ID" />
      <!-- <v-text-field v-model="password" label="パスワード" type="password"/> -->
      <v-btn class="mt-2" type="submit" block @click="login">ログイン</v-btn>
    </v-form>
    <div class="text-center mt-4">
      <v-btn prepend-icon="mdi mdi-account" color="primary" elevation="2" outlined plain @click="$router.push('user_new')">新規アカウント</v-btn>
    </div>
  </v-sheet>
</template>

<script setup lang="ts">

  const router = useRouter()
  const loginUser = useLoginUser()

  const userDisplayId = ref('3333') // FIXME: テスト用の初期値
  const password = ref('3333')

  const login = async () => {
    try {
      const res = await useApiPost(
        'users/login',
        'POST',
        {
          display_id: userDisplayId.value,
          // password: password.value,
        }
      )

      // ログイン情報をステートにセット
      loginUser.value.id = res.value.payload.id
      loginUser.value.name = res.value.payload.name
      loginUser.value.email = res.value.payload.email
      loginUser.value.rank = res.value.payload.rank
      loginUser.value.status = res.value.payload.status
      loginUser.value.display_id = res.value.payload.display_id

      router.push('rank')

    } catch (error) {
      // ポップアップを表示
      alert('ログインに失敗しました。ID、またはパスワードが違います。')
      console.error('ログインエラー:', error)
    }
  }

</script>

<style>
</style>
