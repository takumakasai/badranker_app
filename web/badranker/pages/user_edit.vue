<template>
  <h1>新規アカウント作成</h1>
  <table>
    <tbody>
      <tr>
        <th>名前</th>
        <td>
          <input type="text" v-model="form.name" placeholder="name">
        </td>
      </tr>
      <tr>
        <th>メールアドレス</th>
        <td>
          <input type="text" v-model="form.email" placeholder="email">
        </td>
      </tr>
      <tr>
        <th>パスワード</th>
        <td>
          <input type="password" v-model="form.password" placeholder="password">
        </td>
      </tr>
    </tbody>
  </table>

  <!-- <label for="name">名前</label>
  <input type="text" v-model="form.name" placeholder="name"><br>

  <label for="email">メールアドレス</label>
  <input type="text" v-model="form.email" placeholder="email"><br>

  <label for="password">パスワード</label>
  <input type="password" v-model="form.password" placeholder="password"><br> -->

  <div><button @click="update">変更</button></div>

  <div><button @click="$router.back()">戻る</button></div><br>
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
