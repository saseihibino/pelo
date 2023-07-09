Rails.application.routes.draw do
  devise_for :users
 root "logs#index"
 resources :pets, only: [:new, :create]
 resources :logs do
 collection do
  get 'toiletlog'
end
end
end
