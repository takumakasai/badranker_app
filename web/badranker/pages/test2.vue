<template>
  <v-app>
    <v-app-bar color="primary" prominent>
      <v-app-bar-nav-icon 
        variant="text"
        @click.stop="drawer = !drawer">
      </v-app-bar-nav-icon>
  
      <v-app-bar-title>
        BadRanker
      </v-app-bar-title>
  
    </v-app-bar>
  
    <v-navigation-drawer
      v-model="drawer"
      temporary
    >
      <v-list nav>
        <v-list-item prepend-icon="mdi-view-dashboard" title="Home" value="home"></v-list-item>
        <v-list-item prepend-icon="mdi-forum" title="About" value="about"></v-list-item>
      </v-list>
    </v-navigation-drawer>
  
  
    <v-main>
      <v-container>
        <v-sheet min-height="20em">
          Main Contents
          <!-- FIXME: ログイン可能だがログインのそもそもの機能は未実装 -->
          <!-- <UContainer class="mx-auto w-84 flex items-start justify-center h-screen">
            <UFormGroup label="ログイン">
              <UInput type="text" v-model="userId" placeholder="id" /><br>
              <UInput type="password" placeholder="password" /><br>
              <UButton @click="login">ログイン</UButton><br><br>
              <UButton @click="$router.push('user_new')">新規アカウント</UButton><br>
            </UFormGroup>
          </UContainer> -->
          <h1>ログイン</h1>
  
          <v-btn prepend-icon="mdi mdi-account">
            Button1
          </v-btn>
          <i class="mdi mdi-account"></i>
          <span class="mdi mdi-account-cancel-outline"></span>
  
          <v-btn
            color="primary"
            elevation="2"
            outlined
            plain
          >ぼたん１</v-btn>
          <v-btn
            color=""
            elevation="2"
          >ボタン２</v-btn>
          <v-btn
            prepend-icon="mdi mdi-account"
            class="text-none"
            color="primary"
            size="x-large"
            text="Button"
            variant="tonal"
          />
          <v-btn prepend-icon="$vuetify">
            Button
          </v-btn>
          <!-- <v-icon :icon="`mdiSvg:${mdiAccount}`"></v-icon> -->
  
          <br>
          <!-- <h1 class="text-2xl font-bold text-center mb-4">ログイン画面</h1> -->
          <!-- <v-text-field label="id" variant="solo" v-model="userId"></v-text-field> -->
          <!-- <v-text-field label="password" variant="solo" v-model="password"></v-text-field> -->
  
          <input type="text" v-model="userId" placeholder="id" /><br>
          <input type="password" placeholder="password" /><br>
          <button @click="login">ログイン</button><br><br>
          <button @click="$router.push('user_new')">新規アカウント</button><br>
  
  
          <template>
            <v-sheet class="mx-auto" width="300">
              <v-form fast-fail @submit.prevent>
                <v-text-field
                  v-model="userId"
                  :rules="firstNameRules"
                  label="First name"
                ></v-text-field>
  
                <v-text-field
                  v-model="lastName"
                  :rules="lastNameRules"
                  label="Last name"
                ></v-text-field>
  
                <v-btn class="mt-2" type="submit" block>Submit</v-btn>
              </v-form>
            </v-sheet>
          </template>
        </v-sheet>
      </v-container>
    </v-main>
    <v-footer color="primary">
      (c) テクマテック
    </v-footer>
  </v-app>
  </template>
  
  <script setup lang="ts">
    const drawer = ref(false)
  
    const router = useRouter()
    const loginUser = useLoginUser()
  
    const userId = ref('2') // FIXME: テスト用に初期値で2をセット
  
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
  
  /* 背景を黒、テキストを白 */
  /* body {
    background-color: gray;
    color: white;
  } */
  /* ボタンはモダンで、影付きの角丸のskyblueで、カーソルを合わせたら指マークにする*/
  /* button {
    background-color: skyblue;
    border: none;
    border-radius: 5px;
    padding: 10px 20px;
    box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.5);
    cursor: pointer;
    transition: box-shadow, background-color;
  }
  button:active {
    box-shadow: 1px 1px 1px rgba(0, 0, 0, 0.5);
    background-color: deepskyblue;
  } */
  
  /* h1タグは青色にしたい */
  /* h1 {
    color: blue;
  } */
  
  
  </style>
  