class Battle < ApplicationRecord
  belongs_to :challenger, class_name: 'User'
  belongs_to :defender, class_name: 'User'

  # 未承認：0, 承認：1, 否認：2
  enum defender_approval_status: {
    unapproved: 0,
    approved: 1,
    rejected: 2
  }

  # 未判定：0, 勝ち: 1, 負け: 2, 引き分け: 3
  enum challenger_result_status: {
    undetermined: 0,
    win: 1,
    lose: 2,
    draw: 3
  }

  def approve
    self.defender_approval_status = :approved
    save
  end

  def reject
    self.defender_approval_status = :rejected
    save
  end

  # def win?
  #   self.challenger_result_status == :win
  # end
end
