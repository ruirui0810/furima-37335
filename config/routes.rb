Rails.application.routes.draw do
  devise_for :users
  post 'items/new' => 'items#new'

  root to: 'items#index'
  resources :items, only: [:index, :new, :create]
end
