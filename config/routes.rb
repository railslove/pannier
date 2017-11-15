Rails.application.routes.draw do
  resource :session
  resources :expenses

  root 'pages#home'

  get '/login', to: 'sessions#new', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'
end
