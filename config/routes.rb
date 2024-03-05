Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :clothes, only: %i[index show] do
    resources :transactions, only: %i[create]
    resources :likes, only: %i[create]
  end

  namespace :owner do
    resources :clothes, only: %i[new create edit update destroy]
    resources :transactions, only: %i[index]do
    patch 'manage'
    end
  end

  resources :likes, only: %i[destroy]

  resources :news, only: %i[index]

  resources :profils, only: %i[show edit update] do
    resources :chatrooms, only: %i[index]
    resources :likes, only: %i[index]
  end

  resources :chatrooms, only: %i[show]

  resources :transactions, only: %i[edit update]

end
