// FIXME: 作業中・・・ログイン情報をストアでもたせる
export const state = () => ({
  user: ref(null)
})

export const actions = {
  setUser({ state }, user) {
    state.user = user
  }
}
