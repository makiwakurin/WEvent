Rails.application.routes.draw do
  get 'messages/index'
  devise_for :users
  root to: 'events#index'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :events, only: [:index, :new, :create, :destroy, :show] do

    resources :tasks
  end

  resources :rooms, only: [:index, :new, :create, :destroy] do
    resources :messages, only: [:index, :new, :create]
  end
end