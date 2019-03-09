# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#top'
  get 'about' => 'home#about'
  get 'users/:id/likes' => 'users#likes'
  post '/like/:id' => 'likes#like', as: 'like'
  delete '/like/:id' => 'likes#unlike', as: 'unlike'
  devise_for :users,skip: :session,
  :controllers => {
    :registrations => 'users/registrations'
   }
  devise_scope :user do
    get 'login' => 'devise/sessions#new', as: :new_user_session
    post 'login' => 'devise/sessions#create', as: :user_session
    delete 'logout' => 'devise/sessions#destroy', as: :destroy_user_session
  end
  resources :users, only: [:index, :show]
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
