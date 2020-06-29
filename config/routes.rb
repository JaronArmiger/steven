Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  get '/users/edit_color', to: 'users#edit_color'
  patch '/users/update_color', to: 'users#update_color'
  root 'static_pages#home'
  resources :posts
end
