Rails.application.routes.draw do

  #devise_for :users
  #mount_devise_token_auth_for 'User', at: 'auth'

  post 'auth_user' => 'authentication#authenticate_user'
  post 'register_user' => 'authentication#register_user'

  get '/confirmation/index'

  get '/conversations/index' => 'conversations#index'
  post '/conversations/create' => 'conversations#create'

  get '/messages/index' => 'messages#index'
  post '/messages/create' => 'messages#create'

  root 'pages#index'
  #get 'pages/index'
  get '/.well-known/acme-challenge/:id' => 'pages#letsencrypt'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
