<template>
  <v-sheet class="mx-auto semi-transparent" width="300" min-height="20em">
    <v-form fast-fail @submit.prevent>
      <v-text-field v-model="userId" label="ID" />
      <v-text-field v-model="password" label="パスワード" />
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

  const userId = ref('2') // FIXME: テスト用に初期値で2をセット
  const password = ref('')

  const login = async () => {
    try {
      const res = await useApi('users/' + userId.value)
      // ログイン情報をステートにセット
      loginUser.value.id = res.value.payload.id
      loginUser.value.name = res.value.payload.name
      loginUser.value.email = res.value.payload.email
      loginUser.value.rank = res.value.payload.rank
      loginUser.value.status = res.value.payload.status

      router.push('rank')

    } catch (error) {
      console.error('Error occurred:', error)
    }
  }

</script>

<style>
</style>
