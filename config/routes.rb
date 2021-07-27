Rails.application.routes.draw do
  get 'messages/_main_chat'
  devise_for :users
  root to: "items#index"
  resources :users, only: [:edit, :update]
  
  resources :items do
    resources :rooms, only: [:new, :create, :destroy, :index] do
      resources :messages, only: [:index, :create]
    end
  end
end
