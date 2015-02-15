Rails.application.routes.draw do
  resources :tasks
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:create]

  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'

  root 'tasks#index'
end
