Rails.application.routes.draw do
  devise_for :users
  root to: 'expenses#index'
  resources :expenses, only: [:new, :create, :edit, :update, :destroy, :show] do
    resources :comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  get 'expenses/:id/checked', to: 'expenses#checked'
  resources :users, only: [:show]
end
