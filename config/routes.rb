Rails.application.routes.draw do
  get 'visits/new'
  get 'visits/create'
  get 'visits/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :donations do
  	resources :reservations, only: [ :index, :create, :edit, :update, :destroy, :new ]
  	#resources :categories, only: [ :index, :show ]
  end

  resources :users, only: [ :show ]
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
