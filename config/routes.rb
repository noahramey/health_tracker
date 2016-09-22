Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root :to => 'home#index'

  resources :foods
  resources :exercises

  devise_for :users, controllers: { registrations: "registrations" }
end
