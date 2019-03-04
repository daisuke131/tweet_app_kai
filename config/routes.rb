Rails.application.routes.draw do
  root 'home#top'
  get 'about' => 'home#about'
  devise_for :users
  resources :users, only: [:index, :show]
  resources :posts
    # resources :users do
  #   resources :posts
  # end
end
