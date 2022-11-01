Rails.application.routes.draw do
  resources :users, except: [:create]
  resources :wishlists
  resources :subscriptions
  resources :categories
  resources :reviews
  resources :profiles
  resources :posts
  
  post '/login' => 'auth#login'
  get '/me', to: 'users#show_me'
  put '/profile/update', to: 'profiles#update_profile'
  post '/signup', to: 'users#create'

end
