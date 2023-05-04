Rails.application.routes.draw do

  devise_for :users
  get 'tops', to: 'tops#index'
  root to: 'articles#index'
  #resources :users, only: [:edit, :update]
  resources :articles
  
end
