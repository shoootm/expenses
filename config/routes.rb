Rails.application.routes.draw do
  devise_for :users
  root to: 'expenses#index'
  #resources :users, only: [:edit, :update]

end
