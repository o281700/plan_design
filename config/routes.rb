Rails.application.routes.draw do
  devise_for :users
  root 'plans#index'
  resources :plans, only: [:index, :new, :create, :destroy, :edit, :update] do
    resources :items, only: [:new, :create]
  end
end
