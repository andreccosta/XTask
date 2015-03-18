Rails.application.routes.draw do
  resources :tasks do
  	post :upload, on: :member
  	get :download, on: :member
  end
  resources :users, only: [:new, :create, :show] 
  resources :sessions, only: [:create]

  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'

  root 'tasks#index'
end
