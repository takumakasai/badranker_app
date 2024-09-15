Rails.application.routes.draw do
  get "samples" => "samples#sample"


  get "users/rank" => "users#rank"
  get "users/vs_challenge" => "users#vs_challenge"
  patch "users/update_rank" => "users#update_rank"
  resources :users
  # get "users" => "users#index"
  # get "users/:id" => "users#show"

  post "battles/battle"
  get 'battles/index'
  get 'battles/show'
  get 'battles/unapproved_list'
  patch 'battles/approve'
  patch 'battles/reject'

end
