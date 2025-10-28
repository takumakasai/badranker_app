<template>
  <v-sheet class="mx-auto semi-transparent custom-sheet" width="100%" min-height="20em">
    <v-container>
      <v-row justify="center">
        <v-col cols="12">
          <v-card class="elevation-3">
            <v-card-title class="text-h5 text-center">{{ profile?.name }}</v-card-title>
            <v-card-text>
              <v-row>
                <v-col cols="12">
                  <p><strong>ランク：</strong> {{ profile.rank }}</p>
                  <p>
                    <strong>プレイスタイル：</strong>
                    <template v-if="profile.play_style == 'attack'">
                      {{ '攻撃タイプ' }}
                      <img src="@/assets/image/icon_sword.png" alt="sword" class="icon-image" />
                    </template>
                    <template v-else-if="profile.play_style == 'receive'">
                      {{ 'レシーブタイプ' }}
                      <img src="@/assets/image/icon_shield.png" alt="shield" class="icon-image" />
                    </template>
                    <template v-else-if="profile.play_style == 'balance'">
                      {{ 'バランス型' }}
                      <img src="@/assets/image/icon_balance3.png" alt="balance" class="icon-image" />
                    </template>
                  </p>
                </v-col>
                <v-col cols="12">
                  <p>
                    <i class="mdi mdi-sword" style="color:black" /> オフェンス：{{ profile.offense }}
                    <v-progress-linear :model-value="profile.offense" max="10" color="red" height="10" />
                  </p>
                  <p>
                    <i class="mdi mdi-shield" style="color:black" /> ディフェンス：{{ profile.defense }}
                    <v-progress-linear :model-value="profile.defense" max="10" color="blue" height="10" />
                  </p>
                  <p>
                    <i class="mdi mdi-shoe-sneaker" style="color:black" /> スピード：{{ profile.speed }}
                    <v-progress-linear :model-value="profile.speed" max="10" color="green" height="10" />
                  </p>
                  <p>
                    <i class="mdi mdi-scale-balance" style="color:black" /> 安定性：{{ profile.stability }}
                    <v-progress-linear :model-value="profile.stability" max="10" color="purple" height="10" />
                  </p>
                </v-col>
              </v-row>
              <v-divider class="my-4"></v-divider>
              <p><strong>特徴：</strong> {{ profile.description }}</p>
              <p><strong>スキル：</strong> {{ profile.special_skill }}</p>
              <v-divider class="my-4"></v-divider>

              <!-- バッジ一覧（称号） -->
              <h3 class="badge-title">バッジ</h3>
              <div class="badge-grid">
                <div v-for="badge in badges" :key="badge.id" class="badge-item">
                  <img
                    :src="`/badges/${badge.badge_icon_path}`"
                    :alt="badge.name"
                    class="badge-icon"
                    :class="{ 'badge-unacquired': !badge.acquired }"
                  />
                  <div class="badge-name" :class="{ 'badge-unacquired-text': !badge.acquired }">
                    {{ badge.name }}
                  </div>
                </div>
              </div>
            </v-card-text>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
    <div class="text-center">
      <v-btn @click="$router.back()" color="secondary" class="ml-2">戻る</v-btn>
    </div>
  </v-sheet>
</template>

<script setup lang="ts">
// ルートパラメータ取得
const route = useRoute()
const userId = route.params.userId

const data = await useApi(`users/${userId}`)

const profile = computed(() => data?.value?.payload.user || {}) // user があればそれを使う
const badges = computed(() => data?.value?.payload.quests || []) // badges が user に含まれていれば利用

</script>

<style>
.custom-sheet {
  background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
  border-radius: 15px;
  padding: 10px;
}

.v-card {
  margin: 10px;
}

.v-card-title {
  font-size: 1.2rem;
}

.v-progress-linear {
  margin-top: 5px;
}

/* バッジアイコンスタイル */
.badge-title {
  font-size: 0.9rem;
  /* font-weight: bold; */
  text-align: left;
}

.badge-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  grid-template-rows: repeat(2, auto);
  gap: 8px 4px;           /* ← gapを小さく */
  justify-items: center;
  align-items: start;
  margin: 8px 0;          /* ← marginも小さく */
  width: 100%;
}

/* .badge-item {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  min-height: 80px;
} */

.badge-item {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: flex-start;
  min-height: 70px;
  height: 80px;           /* ← 高さを固定 */
  /* border: 1px solid #bbb; */ /* ボーダーの有無 */
  border-radius: 8px;
  padding: 4px 2px;
  background: #fff;
  box-sizing: border-box;
  margin: 0 auto;
  max-width: 60px;
  width: 100%;            /* ← 幅もグリッドセルに合わせて揃える */
}

/* 光るバッジ用アニメーション */
@keyframes badge-glow {
  0% {
    filter: brightness(1) drop-shadow(0 0 0px #ffd700);
  }
  50% {
    filter: brightness(1.8) drop-shadow(0 0 12px #ffd700);
  }
  100% {
    filter: brightness(1) drop-shadow(0 0 0px #ffd700);
  }
}

.badge-icon {
  width: 40px;             /* ← アイコンを小さく */
  height: 40px;
  object-fit: contain;
  margin-bottom: 2px;
  transition: filter 0.2s;
}

/* acquired=true の場合だけ光る */
.badge-icon:not(.badge-unacquired) {
  animation: badge-glow 1.5s infinite;
}

/* 未獲得バッジはグレースケール＋透明度ダウン */
.badge-unacquired {
  filter: grayscale(1) brightness(0.2) opacity(1);
}

.badge-name {
  font-size: 0.7rem;  /* ここを0.7remなどに小さく調整 */
  text-align: center;   /* ← ここをcenterに */
  color: #555;
  word-break: break-all;
  max-width: 60px;
  width: 100%;          /* ← 追加：中央寄せを安定させる */
  margin: 0 auto;       /* ← 追加：中央寄せを安定させる */
}

/* 未獲得バッジ名は薄い色に */
.badge-unacquired-text {
  color: #bbb;
}
</style>
