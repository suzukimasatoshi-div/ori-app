Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/new'
  devise_for :users
  root to: "items#index"
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end
  resources :items
  resources :articles
end
