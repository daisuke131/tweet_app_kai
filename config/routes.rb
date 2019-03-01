Rails.application.routes.draw do
  get 'posts/index'
  root 'home#top'
  get 'about' => 'home#about'
  resources :posts
end
