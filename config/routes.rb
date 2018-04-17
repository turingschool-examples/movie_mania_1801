Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  resources :directors, shallow: true do
    resources :movies
  end
  resources :movies, only: [:index]
  resources :actors

  resources :users, only: [:new, :create, :show]
  resources :genres, only: [:index, :show]

  namespace :admin do
    resources :categories, only: [:index]
    resources :genres, only: [:index, :new, :create]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post '/cart', to: 'cart#create'
end
