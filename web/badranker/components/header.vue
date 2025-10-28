<template>
  <v-app-bar color="primary" prominent>
    <v-app-bar-nav-icon 
      variant="text"
      @click.stop="drawer = !drawer">
    </v-app-bar-nav-icon>
    <v-img
      src="@/assets/image/logo3.png"
      alt="Logo"
      class="logo"
      max-width="50"
    ></v-img>
    <v-app-bar-title>
      BadRanker
    </v-app-bar-title>
  </v-app-bar>
  <v-navigation-drawer v-model="drawer" temporary>
    <v-list nav>
      <v-list-item prepend-icon="mdi-view-dashboard" title="ランク" value="ランク" @click="$router.push('rank')"></v-list-item>
      <v-list-item prepend-icon="mdi-set-left" title="クエスト" value="quest" @click="$router.push('quest')"></v-list-item>
      <template v-if="loginUser.role === 2">
        <v-list-item prepend-icon="mdi-package-check" title="クエスト承認" value="admin_quest" @click="$router.push('admin_quest')"></v-list-item>
      </template>
      <v-list-item prepend-icon="mdi-pencil" title="アカウント編集" value="user_edit" @click="$router.push('user_edit')"></v-list-item>
      <v-list-item prepend-icon="mdi-logout" title="ログアウト" value="logout" @click="logout"></v-list-item>
    </v-list>
  </v-navigation-drawer>
</template>

<script setup lang="ts">
import { ref } from 'vue'

const loginUser = useLoginUser()
const router = useRouter()

const drawer = ref(false)

const logout = () => {
  if (confirm('ログアウトしますか？')) {
    alert('ログアウトしました。')
    router.push('/')
  }
}
</script>