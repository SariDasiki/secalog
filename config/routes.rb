Rails.application.routes.draw do
  root 'tasks#index'
  resources :tasks, only: [:new, :index, :create, :show, :edit]
  resources :users, only: [:new, :create, :show, :edit]
  resources :sessions, only: [:new, :create, :destroy]
end
