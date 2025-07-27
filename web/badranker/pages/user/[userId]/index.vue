<template>
  <v-sheet class="mx-auto semi-transparent custom-sheet" width="100%" min-height="20em">
    <v-container>
      <v-row justify="center">
        <v-col cols="12">
          <v-card class="elevation-3">
            <v-card-title class="text-h5 text-center">{{ user?.payload.name }}</v-card-title>
            <v-card-text>
              <v-row>
                <v-col cols="12">
                  <p><strong>ランク：</strong> {{ user.payload.rank }}</p>
                  <p>
                    <strong>プレイスタイル：</strong>
                    <template v-if="user.payload.play_style == 'attack'">
                      {{ '攻撃タイプ' }}
                      <img src="@/assets/image/icon_sword.png" alt="sword" class="icon-image" />
                    </template>
                    <template v-else-if="user.payload.play_style == 'receive'">
                      {{ 'レシーブタイプ' }}
                      <img src="@/assets/image/icon_shield.png" alt="shield" class="icon-image" />
                    </template>
                    <template v-else-if="user.payload.play_style == 'balance'">
                      {{ 'バランス型' }}
                      <img src="@/assets/image/icon_balance3.png" alt="balance" class="icon-image" />
                    </template>
                  </p>
                </v-col>
                <v-col cols="12">
                  <p>
                    <i class="mdi mdi-sword" style="color:black" /> オフェンス：{{user.payload.offense}}
                    <v-progress-linear :model-value="user.payload.offense" max="10" color="red" height="10" />
                  </p>
                  <p>
                    <i class="mdi mdi-shield" style="color:black" /> ディフェンス：{{ user.payload.defense }}
                    <v-progress-linear :model-value="user.payload.defense" max="10" color="blue" height="10" />
                  </p>
                  <p>
                    <i class="mdi mdi-shoe-sneaker" style="color:black" /> スピード：{{ user.payload.speed }}
                    <v-progress-linear :model-value="user.payload.speed" max="10" color="green" height="10" />
                  </p>
                  <p>
                    <i class="mdi mdi-scale-balance" style="color:black" /> 安定性：{{ user.payload.stability }}
                    <v-progress-linear :model-value="user.payload.stability" max="10" color="purple" height="10" />
                  </p>
                </v-col>
              </v-row>
              <v-divider class="my-4"></v-divider>
              <p><strong>スキル：</strong> {{ user.payload.special_skill }}</p>
              <p><strong>特徴：</strong> {{ user.payload.description }}</p>
              <v-divider class="my-4"></v-divider>
              <v-row>
                <v-col class="text-center">
                  <v-btn @click="$router.back()" color="secondary" class="ml-2">戻る</v-btn>
                </v-col>
              </v-row>
            </v-card-text>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </v-sheet>
</template>

<script setup lang="ts">
// ルートパラメータ取得
const route = useRoute()
const userId = route.params.userId

const user = await useApi(`users/${userId}`)
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
</style>
