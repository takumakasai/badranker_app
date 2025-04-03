// FIXME: 初期値はテスト用
export const useLoginUser = () => useState('loginUser', () => (
  {
    id: 2,
    name: 'test',
    email: 'test',
    rank: 2,
    status: 1,
    display_id: 'test',
  }
))
