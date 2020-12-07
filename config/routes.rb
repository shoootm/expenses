Rails.application.routes.draw do
  devise_for :users
  root to: 'expenses#index'
  resources :expenses, only: [:new, :create, :edit, :update, :destroy, :show] do
    resources :comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  get  'expenses/:expense_id/checked', to: 'favorites#checked'
  get 'expenses/:expense_id/favorite_counts/:count', to: 'favorite_counts#count'
  resources :favorites, only: [:index]
  resources :users, only: [:show]
end
