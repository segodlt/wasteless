Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home' do
    resources :recipes, only: :index
  end

  get '/dashboard', to: 'pages#dashboard'
  get '/account', to: 'pages#account'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :recipes do
    resources :reviews, only: [:index, :create, :update]
    resources :measures, only: [ :new, :create, :destroy ]
  end
  resources :reviews, only: [:edit, :destroy]
  resources :favorites, only: [:index, :create, :destroy]
  resources :groceries, only: [:index, :create, :destroy]

  resources :categories, only: [:index, :show]
  resources :ingredients, only: [:index, :show]
  get "api/ingredients", to: "ingredients#create_json"
end
