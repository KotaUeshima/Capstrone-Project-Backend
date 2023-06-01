Rails.application.routes.draw do
  # Create all RESTful routes
  # can limit with "resources :users, only: [:index, :show]"
  resources :songs
  resources :users
  # get all of a user's songs
  get '/user_songs/:id', to: 'songs#show'
  # login functionality
  post '/login', to: 'auth#login'
  get '/authorized', to: 'auth#authorization'
end
