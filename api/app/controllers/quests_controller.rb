class QuestsController < ApplicationController
  def index

  end

  # ユーザー用のクエスト一覧を取得
  def index_for_user
    quests = Quest.all

    json = quests.map do |quest|
      {
        id: quest.id,
        name: quest.name,
        description: quest.description,
        badge_icon_path: quest.badge_icon_path,
        status: UserQuest.find_by(quest_id: quest.id, user_id: params[:user_id])&.status || 0,
      }
    end

    render json: { payload: json }
  end

  def challenge
    user_id = params[:user_id]
    quest_id = params[:quest_id]
    user_quest = UserQuest.find_or_initialize_by(user_id: user_id, quest_id: quest_id)

    user_quest.status = :in_progress # チャレンジ中のステータスを設定
    if user_quest.save
      render json: { message: 'チャレンジを開始しました。' }, status: :ok
    else
      render json: { error: 'チャレンジの開始に失敗しました。' }, status: :unprocessable_entity
    end
  end

  def cancel
    user_id = params[:user_id]
    quest_id = params[:quest_id]
    user_quest = UserQuest.find_by(user_id: user_id, quest_id: quest_id)

    user_quest.status = :standby # 未開始のステータスに戻す
    if user_quest.save
      render json: { message: 'チャレンジをキャンセルしました。' }, status: :ok
    else
      render json: { error: 'チャレンジのキャンセルに失敗しました。' }, status: :not_found
    end
  end

  # def complete
  #   user_id = params[:user_id]
  #   quest_id = params[:quest_id]
  #   user_quest = UserQuest.find_by(user_id: user_id, quest_id: quest_id)

  #   user_quest.status = :completed # 達成のステータスに更新
  #   if user_quest.save
  #     render json: { message: 'クエストを達成しました。' }, status: :ok
  #   else
  #     render json: { error: 'クエストの達成に失敗しました。' }, status: :unprocessable_entity
  #   end
  # end

  # 申請中のクエスト一覧を取得
  def index_for_request
    user_quests = UserQuest.where(status: :in_progress)

    json = user_quests.map do |user_quest|
      {
        id: user_quest.id,
        user_name: user_quest.user.name,
        quest_name: user_quest.quest.name,
        quest_description: user_quest.quest.description,
        status: user_quest.status,
      }
    end

    render json: { payload: json }
  end

  def approve
    user_quest = UserQuest.find_by(id: params[:id])

    user_quest.status = :completed # 達成のステータスに更新
    if user_quest.save
      render json: { message: '承認しました。' }, status: :ok
    else
      render json: { error: '承認が失敗しました。' }, status: :unprocessable_entity
    end
  end

  def deny
    user_quest = UserQuest.find_by(id: params[:id])

    user_quest.status = :standby # 未開始のステータスに戻す
    if user_quest.save
      render json: { message: '否認しました。' }, status: :ok
    else
      render json: { error: '否認が失敗しました。' }, status: :unprocessable_entity
    end
  end
end
