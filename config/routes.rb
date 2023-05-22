Rails.application.routes.draw do
  # Create all RESTful routes
  # can limit with "resources :users, only: [:index, :show]"
  resources :songs
  resources :users
  get '/user_songs/:id', to: 'songs#show'
  post '/login', to: 'auth#create'
  get '/me', to: 'users#show'
  get '/count', to: 'users#count'
end
