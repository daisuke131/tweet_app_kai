# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#top'
  get 'about' => 'home#about'
  get 'users/:id/likes' => 'users#likes'
  devise_for :users, skip: [:sessions, :password], 
  :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
   }
  devise_scope :user do
    get 'login', to: 'devise/sessions#new', as: :new_user_session
    post 'login', to: 'devise/sessions#create', as: :user_session
    delete 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end
  resources :users, only: [:index, :show]
  resources :posts do
    resources :likes, only: %i[create destroy]
    resources :comments, only: %i[create destroy]
  end
end
