Rails.application.routes.draw do
  resources :users
  resources :wishlists
  resources :subscriptions
  resources :categories
  resources :reviews
  resources :profiles
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
