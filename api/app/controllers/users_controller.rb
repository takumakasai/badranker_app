class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: { status: 'index', message: 'Get sample data', data: { sample: 'hogehoge' } }
  end

  def show
    user = User.find(params[:id])
    render json: { payload: user }
  end

  def create
    # userの一番下のランクを取得
    last_user_rank = User.order(rank: :desc).first.rank
    new_rank = last_user_rank + 1

    # FIXME: パスワードがない
    user = User.new(
      name: params[:name],
      email: params[:email],
      rank: new_rank,
      status: '1'
    )

    if user.save
      render json: { payload: user }
    else
      render json: { payload: user.errors }
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(
      name: params[:name],
      email: params[:email],
      status: '1'
    )
      render json: { payload: user }
    else
      render json: { payload: user.errors }
    end
  end

  def rank
    users = User.all.order(rank: :asc)

    json = users.map do |user|
      {
        id: user.id,
        rank: user.rank,
        name: user.name,
        is_unapproved: user.defended_battles.where(defender_approval_status: :unapproved).count > 0,
      }
    end

    render json: { payload: json}
  end

  def vs_challenge
    user = User.find(params[:id])
    render json: { payload: user}
  end

  # def update_rank
  #   self_user = User.find(params[:self_id])
  #   opponent_user = User.find(params[:opponent_id])

  #   # 更新前のランクを取得
  #   before_self_rank = self_user.rank # 自身のランク(現状)
  #   before_opponent_rank = opponent_user.rank # 相手のランク(現状)
  #   # 相手～自分より一つ上のランクのユーザーをランクダウン
  #   rank_down_users= User.where("rank >= #{before_opponent_rank} AND rank < #{before_self_rank}") # ランクダウン対象取得
  #   rank_down_users.update_all('rank = rank + 1') # ランクダウン

  #   # 勝ったユーザーをランクアップ
  #   self_user.update!(rank: before_opponent_rank) 

  # end
end

