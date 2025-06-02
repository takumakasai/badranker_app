<template>
  <v-sheet class="mx-auto semi-transparent custom-sheet" width="" min-height="20em">
    <!-- <h1 class="text-center game-font"><i class="mdi mdi-podium" /> Rank</h1> -->
    <h1 class="text-center"><i class="mdi mdi-badminton" style="color:black" /> ランク</h1>
    <div class="text-center"><p>{{ `ログイン：${loginUser.name} (ランク：${loginUser.rank}位)`}}</p></div>
    <div class="text-center"><v-btn @click="$router.push(`user/${loginUser.id}`)">ユーザ</v-btn></div><br>
    <div class="text-center"><v-btn @click="$router.push('user_edit')">アカウント編集</v-btn></div><br>
    <div v-if="unapproved_list?.payload?.length" class="text-center"><v-btn @click="$router.push('vs_defense')">VS防衛</v-btn></div><br>
    <table>
      <!-- <thead>
        <tr>
          <th>ランク</th>
          <th>名前</th>
          <th>タイプ</th>
          <th>ステータス</th>
          <th>操作</th>
        </tr>
      </thead> -->
      <tbody>
        <tr v-for="user in users.value?.payload" :key="user.id" class="card-background">
          <td class="text-center tight-padding rank-cell">
            <template v-if="user.rank == 1">
              <v-img src="@/assets/image/crown_first.png" alt="crown_first" class="crown_first" />
            </template>
            <template v-else-if="user.rank == 2">
              <v-img src="@/assets/image/crown_second.png" alt="crown_second" class="crown_second" />
            </template>
            <template v-else-if="user.rank == 3">
              <v-img src="@/assets/image/crown_third.png" alt="crown_third" class="crown_third" />
            </template>
            <template v-else>
              <div>
                {{ user.rank }}
              </div>
            </template>
          </td>
          <td class="tight-padding" style="width: 150px;">
            <div class="vertical-split large-text">
              <div class="upper user-name user-background">
                <NuxtLink :to="`/user/${user.id}`">{{ user.name }}</NuxtLink>
                <span style="flex-grow: 1;"></span> <!-- 空白を埋めるための要素 -->
                <!-- <i class="mdi mdi-shield" style="color:black" /> -->

                <!-- FIXME: TEST用 -->
                <template v-if="user.play_style == 'attack'">
                  <img src="@/assets/image/icon_sword.png" alt="sword" class="icon-image" />
                </template>
                <template v-else-if="user.play_style == 'receive'">
                  <img src="@/assets/image/icon_shield.png" alt="shield" class="icon-image" />
                </template>
                <template v-else-if="user.play_style == 'balance'">
                  <img src="@/assets/image/icon_balance3.png" alt="shield" class="icon-image" />
                </template>

              </div>
              <div class="lower user-status">
                <i class="mdi mdi-sword" style="color:black" />{{ user.offense }}
                <i class="mdi mdi-shield" style="color:black" />{{ user.defense }}
                <i class="mdi mdi-shoe-sneaker" style="color:black" />{{ user.speed }}
                <i class="mdi mdi-scale-balance" style="color:black" />{{ user.stability }}
              </div>
              <div class="user-skill">
                {{ `スキル：${user.special_skill}` }}
              </div>
            </div>
          </td>
          <td class="text-center tight-padding">
            <template v-if="loginUser.rank > user.rank && !user.is_unapproved">
              <v-btn @click="$router.push(`${user.id}/vs_challenge`)" size="small"><i class="mdi mdi-tennis" style="color:black" />VS</v-btn>
            </template>
          </td>
        </tr>
      </tbody>
    </table>
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
/* .game-font {
  font-family: 'Press Start 2P', sans-serif;
} */

.tight-padding {
  padding: 2px !important;
}

.vertical-split {
  display: flex;
  flex-direction: column;
  height: 100%; /* 必要に応じて親要素の高さを指定 */
}

.vertical-split .upper {
  flex: 3; /* 75% */
  display: flex;
  align-items: center; /* 中央揃え（必要に応じて） */
  justify-content: flex-start; /* 左揃え（必要に応じて） */
}

.vertical-split .lower {
  flex: 1; /* 25% */
  display: flex;
  align-items: center; /* 中央揃え（必要に応じて） */
  justify-content: flex-start; /* 左揃え（必要に応じて） */
}

.user-name {
  font-size: 0.8rem; /* テキストサイズを少し大きくする */
  display: flex; /* フレックスボックスを使用 */
  align-items: center; /* 縦軸のセンタリング */
  gap: 8px; /* テキストとアイコンの間に余白を追加 */
  justify-content: space-between; /* 左右に要素を配置 */
}

.user-status {
  font-size: 0.7rem; /* テキストサイズを少し大きくする */
  display: flex; /* フレックスボックスを使用 */
  align-items: center; /* 縦軸のセンタリング */
  gap: 3px; /* テキストとアイコンの間に余白を追加 */
}

.user-skill {
  color: rgba(28, 25, 172, 0.928); /* テキストの文字色 */
  font-size: 0.8rem; /* テキストサイズを少し大きくする */
  display: flex; /* フレックスボックスを使用 */
  align-items: center; /* 縦軸のセンタリング */
  gap: 3px; /* テキストとアイコンの間に余白を追加 */
}

.user-background {
  background-color: #edebeb; /* 明るい茶色 (Wheat) */
  border-radius: 8px; /* 角丸の半径 */
  padding: 0 5px; /* 左右のパディングを追加 */
}

.card-background {
  background-image: url('@/assets/image/paper.png'); /* 画像のパスを指定 */
  background-size: cover; /* 画像を要素全体に拡大縮小 */
  background-position: center; /* 画像を中央に配置 */
  background-repeat: no-repeat; /* 画像を繰り返さない */
  border-radius: 8px; /* 必要に応じて角丸を追加 */
  display: block; /* 必須: ブロック要素として扱う */
  margin-bottom: 10px; /* 下に10pxのスペースを追加 */
  background-color: rgba(255, 255, 255, 0.5); /* 白色の半透明を重ねる */
  background-blend-mode: lighten; /* 背景画像と色を合成 */

  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2), /* メインの影 */
              0 1px 2px rgba(0, 0, 0, 0.1) inset; /* 内側の影で凹凸感を追加 */
  border: 1px solid rgba(0, 0, 0, 0.1); /* 輪郭を強調 */
}

.card-background::after {
  content: ''; /* 擬似要素を生成 */
  position: absolute;
  bottom: -10px; /* `margin-bottom` の位置に配置 */
  left: 0;
  right: 0;
  height: 10px; /* `margin-bottom` の高さ */
  background-color: rgba(255, 255, 255, 1); /* 透明度100%の背景色 */
  z-index: 1; /* 必要に応じて調整 */
}

.rank-cell {
  color: #000000; /* テキストの文字色 */
  width: 50px; /* セルの幅を統一 */
  text-align: center; /* テキストを中央揃え */
  background-color: #f0dad8; /* 淡い背景色 (薄いグレー) */
  border-radius: 8px; /* 角丸を追加 */
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), /* 外側の影 */
              inset 0 1px 2px rgba(0, 0, 0, 0.1); /* 内側の影で凹凸感を追加 */
  padding: 10px; /* 内側の余白を追加 */
  border: 1px solid rgba(0, 0, 0, 0.1); /* 輪郭を薄く強調 */
}

.icon-image {
  width: 15px; /* 必要に応じてアイコンの幅を調整 */
  height: 15px; /* 必要に応じてアイコンの高さを調整 */
  object-fit: contain; /* 画像の比率を維持 */
}
</style>
