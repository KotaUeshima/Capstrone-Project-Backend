Rails.application.routes.draw do
  resources :songs
  resources :users, only: [:create, :index]
  get '/user_songs/:id', to: 'songs#show'
  post '/login', to: 'auth#create'
  get '/me', to: 'users#show'
end
