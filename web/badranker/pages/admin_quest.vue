<template>
  <v-sheet class="mx-auto semi-transparent custom-sheet" width="" min-height="20em">
    <h1 class="text-center"><i class="mdi mdi-badminton" style="color:black" /> クエスト承認(管理者)</h1>
    <table>
      <tbody>
        <!-- クエスト -->
        <tr v-for="quest in quests.value?.payload" :key="quest.id" class="card-background">
          <td class="text-center tight-padding rank-cell">
            <!-- <template v-if="quest.rank == 1">
              <v-img src="@/assets/image/icon_sword.png" alt="crown_first" class="crown_first" />
            </template>
            <template v-else>
              <div>
                {{ quest.rank }}
              </div>
            </template> -->
          </td>
          <td class="tight-padding" style="width: 150px;">
            <div class="vertical-split large-text">
              <div class="upper user-name user-background">
                <!-- TODO:APIから取得 -->
                <p>{{ quest.name }}</p>
                <span style="flex-grow: 1;"></span> <!-- 空白を埋めるための要素 -->
                <!-- <template v-if="quest.play_style == 'attack'">
                  <img src="@/assets/image/icon_sword.png" alt="sword" class="icon-image" />
                </template>
                <template v-else-if="quest.play_style == 'receive'">
                  <img src="@/assets/image/icon_shield.png" alt="shield" class="icon-image" />
                </template>
                <template v-else-if="quest.play_style == 'balance'">
                  <img src="@/assets/image/icon_balance3.png" alt="balance" class="icon-image" />
                </template> -->

              </div>
              <div class="lower user-status">
                <!-- TODO:APIから取得 -->
                <p>{{ quest.description }}</p>
              </div>
            </div>
          </td>
          <td class="text-center tight-padding">
            <template v-if="quest.status === 0">
              <v-btn @click="challengeQuest(quest.id)" size="small"><i class="mdi mdi-tennis" style="color:black" />チャレンジ</v-btn>
            </template>
            <template v-if="quest.status === 1">
              <div class="quest-achieved" size="small">
                <i class="mdi mdi-tennis" style="color:black" />チャレンジ中
              </div>
            </template>
            <template v-if="quest.status === 2">
              <div class="quest-achieved" size="small">
                <i class="mdi mdi-tennis" style="color:black" />達成！
              </div>
            </template>

          </td>
        </tr>
      </tbody>
    </table>
    <div class="text-center">
      <v-btn @click="$router.back()" color="secondary" class="ml-2">戻る</v-btn>
    </div>
  </v-sheet>
</template>

<script setup lang="ts">
  const loginUser = useLoginUser()

  // API実行(ランク情報取得)
  const quests = await useApiIndex(`quests/index_for_user/${loginUser.value.id}`)

  const challengeQuest = async (questId: number) => {
    if (!confirm('このクエストにチャレンジしますか？')) {
      return
    }
    try {
      
      const res = await useApiPost(
        'quests/challenge',
        'PUT',
        {
          user_id: loginUser.value.id,
          quest_id: questId,
        }
      )
      alert('チャレンジを開始しました。')

    } catch (error) {
      console.error('Error occurred:', error)
    }
  }

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

.quest-achieved {
  background: linear-gradient(90deg, #e0ffe0 60%, #b2f7b2 100%);
  border: 2px solid #4caf50;
  border-radius: 8px;
  padding: 4px 12px;
  color: #2e7d32;
  font-weight: bold;
  display: inline-flex;
  align-items: center;
  gap: 4px;
  box-shadow: 0 2px 6px rgba(76, 175, 80, 0.15);
}
</style>
