Rails.application.routes.draw do
  root :to => 'home#index'

  resources :foods
  
  devise_for :users
end
