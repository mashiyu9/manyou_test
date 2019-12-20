Rails.application.routes.draw do
  root to: 'tasks#index'
  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]
  namespace :admin do
    resources :users, only: [:index, :new, :create, :edit, :update, :show, :destroy]
  end
  resources :tasks, only: [:index, :new, :create, :edit, :update, :show, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
end
