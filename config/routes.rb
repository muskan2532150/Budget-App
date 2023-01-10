Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

resources :group do
  resources :entity
end

  # Defines the root path route ("/")
  root "group#index"
end
