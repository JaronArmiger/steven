Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # disable sign up
  # https://stackoverflow.com/questions/39773890/how-to-remove-disable-sign-up-from-devise
  devise_scope :user do
  	get '/sign_in' => 'devise/sessions#new' # custom path to login/sign_in
  	get '/sign_up' => 'devise/registrations#new', as: 'new_user_registration' # custom path to sign up/registration
  end

  devise_for :users, :skip => [:registrations]
    as :user do
    	get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    	put 'users' => 'devise/registrations#update', :as => 'user_registration'
    end
  resources :settings, only: [:edit, :update]
  root 'static_pages#home'
  resources :posts
end
