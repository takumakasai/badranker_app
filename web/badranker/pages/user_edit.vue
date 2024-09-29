<template>
  <v-sheet class="mx-auto semi-transparent" width="50%" min-height="20em">
    <h1 class="text-center">アカウント編集</h1>
    <v-form>
      <v-row>
        <v-col cols="12" md="6">
          <v-text-field
            v-model="form.name"
            label="名前"
            placeholder="name"
            outlined
            required
          ></v-text-field>
        </v-col>
        <v-col cols="12" md="6">
          <v-text-field
            v-model="form.email"
            label="メールアドレス"
            placeholder="email"
            outlined
            required
          ></v-text-field>
        </v-col>
        <v-col cols="12" md="6">
          <v-text-field
            v-model="form.password"
            label="パスワード"
            placeholder="password"
            type="password"
            outlined
            required
          ></v-text-field>
        </v-col>
      </v-row>
      <v-row>
        <v-col class="text-center">
          <v-btn @click="update" color="primary">変更</v-btn>
          <v-btn @click="$router.back()" color="secondary" class="ml-2">戻る</v-btn>
        </v-col>
      </v-row>
    </v-form>
  </v-sheet>
</template>

<script setup lang="ts">
  const router = useRouter()
  // ログインユーザー情報取得
  const loginUser = useLoginUser()

  // 入力フォーム初期値
  const form = ref(
    {
      name: loginUser.value.name,
      email: loginUser.value.email,
      password: '',
    }
  )

  const update = async () => {
    try {
      const res = await useApiPost(
        `users/${loginUser.value.id}`,
        'PATCH',
        {
          name: form.value.name,
          email: form.value.email,
          password: form.value.password,
        }
      )
      alert('アカウント情報を変更しました。')
      router.push('/')
    } catch (error) {
      console.error('Error occurred:', error)
    }
  }

</script>

<style>
</style>
