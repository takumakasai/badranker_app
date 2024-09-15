<template>
  <h1>新規アカウント作成</h1>
  <label for="name">名前</label>
  <input type="text" v-model="form.name" placeholder="name"><br>

  <label for="email">メールアドレス</label>
  <input type="text" v-model="form.email" placeholder="email"><br>

  <label for="password">パスワード</label>
  <input type="password" v-model="form.password" placeholder="password"><br>
  <div><button @click="create">登録</button></div>

  <div><button @click="$router.back()">戻る</button></div><br>
</template>

<script setup lang="ts">
  const router = useRouter()

  // 入力フォーム初期値
  const form = ref(
    {
      name: '',
      email: '',
      password: '',
    }
  )

  const create = async () => {
    try {
      const res = await useApiPost(
        'users',
        'POST',
        {
          name: form.value.name,
          email: form.value.email,
          password: form.value.password,
        }
      )
      alert('アカウントを新規登録しました。')
      router.push('/')
    } catch (error) {
      console.error('Error occurred:', error)
    }
  }

</script>

<style>
</style>
