Rails.application.routes.draw do
  resource :session
  resources :expenses
  resource :user

  root 'pages#home'

  get '/login', to: 'sessions#new', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'
end
