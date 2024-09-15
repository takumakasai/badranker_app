class BattlesController < ApplicationController
  def index
  end

  def show
  end

  # 未承認のバトル一覧
  def unapproved_list
    self_user = User.find(params[:self_id])
    unapproved_list = self_user.defended_battles.where(defender_approval_status: :unapproved)
    json = unapproved_list.map do |battle|
      {
        id: battle.id,
        challenger_id: battle.challenger_id,
        challenger_name: battle.challenger.name,
        challenger_result_status: battle.challenger_result_status,
        defender_id: battle.defender_id,
        defender_name: battle.defender.name,
        defender_approval_status: battle.defender_approval_status
      }
    end
    render json: { payload: json }
  end

  def battle
    self_user = User.find(params[:self_id])
    opponent_user = User.find(params[:opponent_id])
    
    Battle.create(
      challenger_id: self_user.id,
      defender_id: opponent_user.id,
      challenger_result_status: params[:result_status],
      defender_approval_status: :unapproved # 列挙型(未承認)
    )
  end

  # 承認
  def approve
    battle = Battle.find(params[:battle_id])
    battle.approve

    User.update_rank_up(battle.challenger_id, battle.defender_id) if battle.challenger_result_status == 'win'
  end

  # 否認
  def reject
    battle = Battle.find(params[:battle_id])
    battle.reject
  end
end
