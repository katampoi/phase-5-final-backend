Rails.application.routes.draw do
  resources :users
  resources :wishlists
  resources :subscriptions
  resources :categories
  resources :reviews
  resources :profiles
  resources :posts
  
  post '/login' => 'auth#login'
  get '/me', to: 'users#show_me'
  put '/profile/update', to: 'profiles#update_profile'

  patch '/posts/:id/like', to: 'posts#increase_likes'
  patch '/posts/:id/dislike', to: 'posts#decrease_likes'

end
