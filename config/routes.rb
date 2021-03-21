Rails.application.routes.draw do
  get 'messages/index'
  devise_for :users
  root to: 'events#index'

  resources :events, only: [:index, :new, :create, :destroy, :show] do
    resources :tasks
  end
  
  resources :rooms, only: [:new, :create] do
    resources :messages, only: [:index, :new, :create]
  end

end
