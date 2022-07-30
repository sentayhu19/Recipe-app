Rails.application.routes.draw do
  resources :shopping_lists
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

  root 'users#index'
  get '/public_recipes', to: 'public_recipes#index'
end
