Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :settings, only: [:edit, :update]
  root 'static_pages#home'
  resources :posts
end
