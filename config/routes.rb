Rails.application.routes.draw do
  root 'pages#home'
  resources :articles, only: [:show]
  get 'about', to: 'pages#about'
end
