Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :asanas, only: [:index]
  resources :sequences, only: [:index, :create, :new] do
    resources :postures, only: [:index, :new]
  end
  resources :postures, only: :create
  get '/asanas/balancing', to: 'asanas#balancing'
  get '/asanas/inversion', to: 'asanas#inversion'
  get '/asanas/backbending', to: 'asanas#backbending'

  post '/asanas/:id', to: 'asanas#update'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/auth/:provider/callback', to: 'sessions#create'

end
