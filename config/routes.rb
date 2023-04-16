Rails.application.routes.draw do
  get 'home/index'
  get 'home/there'
  post 'home/there', to: "home#there", as: 'there'
  get 'home/query1'
  post 'home/query1', to: "home#query1", as: 'query1'
  root 'home#index'
  
  resources :writes
  resources :genres
  resources :books
  resources :authors
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
