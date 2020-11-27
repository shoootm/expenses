Rails.application.routes.draw do
  devise_for :users
  root to: 'expenses#index'
  #resources :users, only: [:edit, :update]
  resources :expenses, only: [:new, :create, :edit, :update, :destroy]

end
