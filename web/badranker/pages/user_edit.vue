<template>
  <v-sheet class="mx-auto semi-transparent custom-sheet" width="95%" min-height="20em">
    <h1 class="text-center">アカウント編集</h1>
    <v-form>
      <v-row>
        <v-col cols="12" md="6" class="pb-0">
          <!-- hide-details属性は、隠れたv-messagesによる空白を削除する -->
          <v-text-field
            v-model="form.name"
            label="名前"
            placeholder="name"
            outlined
            required
            hide-details
          />
        </v-col>
        <v-col cols="12" md="6" class="pb-0">
          <v-text-field
            v-model="form.display_id"
            label="ID"
            placeholder="id"
            outlined
            required
            hide-details
          />
        </v-col>
        <!-- <v-col cols="12" md="6">
          <v-text-field
            v-model="form.password"
            label="パスワード"
            placeholder="password"
            type="password"
            outlined
            required
          ></v-text-field>
        </v-col> -->
        <v-col cols="12" md="6" class="pb-0">
          <v-text-field
            v-model="form.play_style"
            label="スタイル"
            placeholder="play_style"
            outlined
            required
            hide-details
          />
        </v-col>
        <v-col cols="12" md="6" class="pb-0">
          <v-text-field
            v-model="form.offense"
            label="オフェンス"
            placeholder="offense"
            outlined
            required
            hide-details
          />
        </v-col>
        <v-col cols="12" md="6" class="pb-0">
          <v-text-field
            v-model="form.defense"
            label="ディフェンス"
            placeholder="defense"
            outlined
            required
            hide-details
          />
        </v-col>
        <v-col cols="12" md="6" class="pb-0">
          <v-text-field
            v-model="form.speed"
            label="スピード"
            placeholder="speed"
            outlined
            required
            hide-details
          />
        </v-col>
        <v-col cols="12" md="6" class="pb-0">
          <v-text-field
            v-model="form.stability"
            label="安定性"
            placeholder="stability"
            outlined
            required
            hide-details
          />
        </v-col>
        <v-col cols="12" md="6" class="pb-0">
          <v-text-field
            v-model="form.special_skill"
            label="特技"
            placeholder="special_skill"
            outlined
            required
            hide-details
          />
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

  const user = await useApi(`users/${loginUser.value.id}`)

  // 入力フォーム初期値
  const form = ref(
    {
      name: loginUser.value.name,
      email: loginUser.value.email,
      display_id: loginUser.value.display_id,
      password: '',
      play_style: user.value.payload.play_style,
      offense: user.value.payload.offense,
      defense: user.value.payload.defense,
      speed: user.value.payload.speed,
      stability: user.value.payload.stability,
      special_skill: user.value.payload.special_skill,
    }
  )

  const update = async () => {
    try {
      await useApiPost(
        `users/${loginUser.value.id}`,
        'PATCH',
        {
          name: form.value.name,
          email: form.value.email,
          display_id: form.value.display_id,
          password: form.value.password,
          play_style: form.value.play_style,
          offense: form.value.offense,
          defense: form.value.defense,
          speed: form.value.speed,
          stability: form.value.stability,
          special_skill: form.value.special_skill,
        }
      )
      alert('アカウント情報を変更しました。')
      router.push('/user_edit')
    } catch (error) {
      console.error('Error occurred:', error)
    }
  }

</script>

<style>
</style>
