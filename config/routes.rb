Rails.application.routes.draw do
  # Creates RESTful routes for songs
  resources :songs
  # Limits RESTful routes to create and index
  resources :users, only: [:create, :index]
  get '/user_songs/:id', to: 'songs#show'
  post '/login', to: 'auth#create'
  get '/me', to: 'users#show'
  get '/count', to: 'users#count'
end
