Rails.application.routes.draw do
  devise_for :users
  root 'plans#index'
  resources :plans do
    resources :items, only: [:new, :create, :destroy, :edit, :update] do
      resources :details, only: [:new, :create, :show, :destroy]
    end
  end
end
