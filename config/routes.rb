Rails.application.routes.draw do
  devise_for :users
 root "logs#index"
 resources :pets, only: [:new, :create]
 resources :logs do
 collection do
  get 'toiletlog'
  get 'meallog'
  get 'moodlog'
  get 'walktimelog'
  get 'bodytemperaturelog'
  get 'weightlog'
  get 'lengthlog'
  get 'memolog'
end
end
end
