// 初期処理用API(リロード対応)
export const useApiIndex =  async (endpoint: string) => {
  const data = ref()
   // server: falseでリロードでAPIを実行しない問題を解決
  const response = await useFetch(`http://localhost:3000/${endpoint}`, {server: false})
  data.value = response.data
  return data
}

// API(取得用)
export const useApi = async (endpoint: string) => {
  const data = ref()

  try {
    const response = await $fetch(`http://localhost:3000/${endpoint}`)
    data.value = response
  } catch (error) {
    console.error('Error occurred:', error)
  }

  return data
}

// export const useApiPost =  async (endpoint: string, option: any, body: any) => {
//   $fetch(`http://localhost:3000/${endpoint}`, {
//     method: option,
//     body: body
//   })
// }

// API(POST用)
export const useApiPost = async (endpoint: string, option: any, body: any) => {
  try {
    await $fetch(`http://localhost:3000/${endpoint}`, {
      method: option,
      body: JSON.stringify(body),
      headers: {
        'Content-Type': 'application/json'
      }
    })
  } catch (error) {
    console.error('Error occurred:', error)
  }
}