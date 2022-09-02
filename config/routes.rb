Rails.application.routes.draw do
  devise_for :users
  resources :shopping_lists

  resources :foods, only: %i[index new create show destroy]
  resources :users, only: %i[index new create show destroy]
  resources :recipes, only: %i[index new create show destroy] do
    resources :recipes_foods, only: %i[new create]
  end

  root 'users#index'
  get '/public_recipes', to: 'public_recipes#index'
end
