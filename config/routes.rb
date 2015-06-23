Rails.application.routes.draw do

  devise_for :users
  
  resources :jobs
  root 'pages#home'

  get 'pages/about'
  get 'pages/places'
  
end
