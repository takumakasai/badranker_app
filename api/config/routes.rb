Rails.application.routes.draw do
  get "samples" => "samples#sample"


  get "users/rank" => "users#rank"
  get "users/vs_challenge" => "users#vs_challenge"
  post "users/login" => "users#login"
  patch "users/update_rank" => "users#update_rank"
  resources :users, only: [:index, :create, :update, :show]

  post "battles/battle"
  get 'battles/index'
  get 'battles/show'
  get 'battles/unapproved_list'
  patch 'battles/approve'
  patch 'battles/reject'

  get "quests" => "quests#index"
  get "quests/index_for_user/:user_id" => "quests#index_for_user"
  get "quests/index_for_request" => "quests#index_for_request"
  put "quests/challenge" => "quests#challenge"
  patch "quests/cancel" => "quests#cancel"
  # patch "quests/complete" => "quests#complete"
  patch "quests/approve" => "quests#approve"
  patch "quests/deny" => "quests#deny"


end
