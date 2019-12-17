Rails.application.routes.draw do
  root to: 'tasks#index'
  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]
  resources :tasks, only: [:index, :new, :create, :edit, :update, :show, :destroy]
end
