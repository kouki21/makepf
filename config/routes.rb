Rails.application.routes.draw do
  devise_for :users

  root to: 'homes#top'
  get "home/about" => "homes#about" , as: "about"

  resources :users, only: [:show, :edit, :update]

  post "follow/:id" => "relationships#follow" , as: "follow"
  post "unfollow/:id" => "relationships#unfollow" , as: "unfollow"

  resources :objectives, only: [:new, :index, :show, :edit, :update, :create, :destroy] do
    resources :objective_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resource :savings, only: [:show]

  resource :timeline, only: [:show]
end
