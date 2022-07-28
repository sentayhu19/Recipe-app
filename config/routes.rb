Rails.application.routes.draw do
  resources :recipes_foods
  resources :recipes
  resources :foods
  devise_for :users

  
  resources :users, only: %i[index show] do
    resources :foods, only: %i[index new create show destroy]
    resources :recipes, only: %i[index new create show destroy]
end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, only: %i[index show] do
    resources :foods, only: %i[index new create show destroy]
    resources :recipes, only: %i[index new create show destroy]
  end

  # Defines the root path route ("/")
  root 'users#index'
  get '/public_recipe', to: 'public_recipes#index'
end
