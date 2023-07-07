Rails.application.routes.draw do
  devise_for :users
 root "logs#index"
 resources :pets, only: [:new, :create]
 resources :logs, only: [:index, :new, :create, :destroy, :edit, :update]
end
