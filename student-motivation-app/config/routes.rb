Rails.application.routes.draw do
<<<<<<< HEAD
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
<<<<<<< HEAD
=======
=======
>>>>>>> 2b4bfd6d20c6ac0e8513d0fa2354ed938578f83d
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
<<<<<<< HEAD
=======
>>>>>>> 0c34610e29c0b6a2644f2a65db2c1fcf7b8ad404
>>>>>>> 2b4bfd6d20c6ac0e8513d0fa2354ed938578f83d
end
