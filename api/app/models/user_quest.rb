class UserQuest < ApplicationRecord
  belongs_to :user
  belongs_to :quest

  # ステータス
  # 0: 未開始
  # 1: チャレンジ中
  # 2: 達成
end
