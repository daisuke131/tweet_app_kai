Rails.application.routes.draw do
  root 'home#top'
  get 'about' => 'home#about'
  get 'users/:id/likes' => "users#likes"
  devise_for :users
  resources :users, only: [:index, :show]
  resources :posts do
    resources :likes
    resources :comments
  end
end
