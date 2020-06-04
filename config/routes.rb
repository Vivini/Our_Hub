Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :donations do
  	resources :reservations, only: [ :create, :edit, :update, :destroy ]
  	#resources :categories, only: [ :index, :show ]
  end
  resources :users, only: [ :show ]
end
