Rails.application.routes.draw do
  devise_for :users
 root "logs#index"
 resources :pets, only: [:new, :create]
end
