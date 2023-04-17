Rails.application.routes.draw do
  
  get 'home/index'
  get 'home/there'
  get 'welcome/index'
  post 'home/there', to: "home#there", as: 'there'
  get 'home/query1'
  post 'home/query1', to: "home#query1", as: 'query1'
  get 'home/query2'
  post 'home/query2', to: "home#query2", as: 'query2'
  get 'home/query3'
  post 'home/query3', to: "home#query3", as: 'query3'
  get 'home/query4'
  post 'home/query4', to: "home#query4", as: 'query4'
  get 'home/query5'
  post 'home/query5', to: "home#query5", as: 'query5'
  post 'home/total', to: 'home#total', as: 'total'
  get 'home/total'
  root 'welcome#index'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
