Rails.application.routes.draw do
  get 'pages/index'
  get '/.well-known/acme-challenge/:id' => 'pages#letsencrypt'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
