Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  root 'static_pages#home'
  resources :posts,    only: [:create, :show, :index]
end
