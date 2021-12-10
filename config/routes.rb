Rails.application.routes.draw do
  root 'users#index'

  resources :users, only: [:index, :show, :create] do
    resources :posts, only: [:index, :show, :create]
  end

  post '/' => 'users#create'

  resources :posts do
    resources :comments, only: [:create]
    resources :likes, only: [:create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
