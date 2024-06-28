Rails.application.routes.draw do
  namespace :api do
    resources :posts do
      resources :reviews, only: [:create, :index]
    end
    resources :users, only: [:index, :create]
  end
end
