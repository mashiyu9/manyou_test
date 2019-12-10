Rails.application.routes.draw do
  root to: 'tasks#index'
  resources :tasks do
    collection do
      get 'deadline'
    end
  end
end
