Rails.application.routes.draw do
  # resources :recipes_foods
  # resources :recipes
  resources :foods
  devise_for :users

  resources :recipes, only: %i[index new create show destroy] do
    resources :recipes_foods, only: %i[new create]
  end

  resources :users, only: %i[index show] do
    resources :foods, only: %i[index new create show destroy]
    resources :recipes, only: %i[index new create show destroy] do
      resources :recipes_foods, only: %i[new create]
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'users#index'
  # get '/recipes_foods/new', to: 'recipes_foods#new'
  get '/public_recipes', to: 'public_recipes#index'
end
