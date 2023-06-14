Rails.application.routes.draw do
  # Create all RESTful routes
  # can limit with "resources :users, only: [:index, :show]"
  resources :songs
  resources :users
  # top ten route
  get '/top_five', to: 'songs#top_five'
  # login functionality
  post '/login', to: 'auth#login'
  get '/authorized', to: 'auth#authorization'
end
