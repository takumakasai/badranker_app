class User < ApplicationRecord
  has_many :challenged_battles, foreign_key: :challenger_id, class_name: 'Battle'
  has_many :defended_battles, foreign_key: :defender_id, class_name: 'Battle'

  # ランクアップ処理
  def self.update_rank_up(winner_id, loser_id)
    winner = find(winner_id)
    loser = find(loser_id)

    update_ranks(winner, loser)
  end

  private

  def self.update_ranks(winner, loser)
    rank_down_users = where("rank >= ? AND rank < ?", loser.rank, winner.rank)
    rank_down_users.update_all("rank = rank + 1")

    winner.update!(rank: loser.rank)
  end
end
