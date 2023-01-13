Rails.application.routes.draw do
  devise_for :users
root "splashs#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
resources :groups do
  resources :entitys
end
  # Defines the root path route ("/")  
end
