<template>
  <v-sheet class="mx-auto semi-transparent custom-sheet" width="" min-height="20em">
    <!-- <h1 class="text-center game-font"><i class="mdi mdi-podium" /> Rank</h1> -->
    <h1 class="text-center"><i class="mdi mdi-badminton" style="color:black" /> ランク</h1>
    <div class="text-center"><p>{{ `ログイン：${loginUser.name} (ランク：${loginUser.rank}位)`}}</p></div>
    <div class="text-center"><v-btn @click="$router.push('user_edit')">アカウント編集</v-btn></div><br>
    <div v-if="unapproved_list?.payload?.length" class="text-center"><v-btn @click="$router.push('vs_defense')">VS防衛</v-btn></div><br>
    <v-table>
      <thead>
        <tr>
          <th>ランク</th>
          <th>名前</th>
          <th>ID</th>
          <th>操作</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="user in users.value?.payload" :key="user.id">
          <td style="text-align: center;">
            <template v-if="user.rank == 1">
              <v-img src="@/assets/image/crown_first.png" alt="crown_first" class="crown_first" max-width="50"></v-img>
            </template>
            <template v-else-if="user.rank == 2">
              <v-img src="@/assets/image/crown_second.png" alt="crown_second" class="crown_second" max-width="50"></v-img>
            </template>
            <template v-else-if="user.rank == 3">
              <v-img src="@/assets/image/crown_third.png" alt="crown_third" class="crown_third" max-width="50"></v-img>
            </template>
            <template v-else>
              {{ user.rank }}位
            </template>
          </td>
          <td>{{ user.name }}</td>
          <td>{{ user.id }}</td>
          <td>
            <template v-if="loginUser.rank > user.rank && !user.is_unapproved">
              <v-btn @click="$router.push(`${user.id}/vs_challenge`)">VSチャレンジ</v-btn>
            </template>
          </td>
        </tr>
      </tbody>
    </v-table>
    <!-- ログイン情報: {{ loginUser }} -->

    <div class="text-center"><v-btn @click="$router.push('logout')">ログアウト</v-btn></div><br>
  </v-sheet>
</template>

<script setup lang="ts">
  const loginUser = useLoginUser()

  // API実行(防衛の有無を取得)
  const unapproved_list = await useApi(`battles/unapproved_list?self_id=${loginUser.value.id}`)

  // API実行(ランク情報取得)
  const users = await useApiIndex('users/rank')

  // メモ：useAsycnDataは、urlを実行するわけではない。$fetchがurlを実行する関数。
  // useAsyncDataと$fetchは合わせて使う必要がある
  // useFetchはそれらをまとめたもの。返り値はリアクティブ変数となる。


</script>

<style>
.game-font {
  font-family: 'Press Start 2P', sans-serif;
}

</style>
