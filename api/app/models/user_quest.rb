class UserQuest < ApplicationRecord
  belongs_to :user
  belongs_to :quest

    enum status: {
    standby: 0, # 0: 未開始
    in_progress: 1, # 1: チャレンジ中
    completed: 2 # 2: 達成
  }
end
