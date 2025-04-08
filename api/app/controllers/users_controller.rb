class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: { status: 'index', message: 'Get sample data', data: { sample: 'hogehoge' } }
  end

  def show
    user = User.find(params[:id])
    render json: { payload: user }
  end

  def login
    # FIXME: テスト用にパスワード一時的になしに
    # user = User.find_by!(display_id: params[:display_id], password: params[:password])
    user = User.find_by!(display_id: params[:display_id])
    render json: { payload: user }
  end

  def create
    # userの一番下のランクを取得
    last_user_rank = User.order(rank: :desc).first.rank
    new_rank = last_user_rank + 1

    user = User.new(
      name: params[:name],
      email: params[:email],
      rank: new_rank,
      display_id: params[:display_id],
      password: params[:password],
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

    update_params = {
      name: params[:name],
      email: params[:email],
      display_id: params[:display_id],
      status: '1'
    }
    update_params[:password] = params[:password] if params[:password].present?

    if user.update(update_params)
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
        play_style: user.play_style,
        offense: user.offense,
        defense: user.defense,
        speed: user.speed,
        stability: user.stability,
        special_skill: user.special_skill,
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

