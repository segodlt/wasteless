Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :recipes do
    resources :reviews, only: [:index, :create]
  end
  resources :reviews, only: [:edit, :update, :destroy]

  resources :ingredients, only: [ :index, :show ]
end
