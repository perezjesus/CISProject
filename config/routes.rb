Rails.application.routes.draw do
  resources :writes
  resources :genres
  resources :books
  resources :authors
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
