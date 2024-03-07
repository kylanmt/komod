Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check


  # Routes pour les vetements: index et show, ajout d'une transaction et ajout d'un like sur un vetement

  resources :clothes, only: %i[index show] do
    resources :transactions, only: %i[create]
    resources :likes, only: %i[create]
  end

  # Routes pour les profils, show et modification de son profil, acceder à ses messages, acceder à ses likes

  resource :profils, only: %i[show edit update] do
    resources :chatrooms, only: %i[index]
    resources :likes, only: %i[index]
  end



  # Routes pour les likes: annuler un like

  resources :likes, only: %i[destroy]

  # Routes pour les News: affiche les news

  resources :news, only: %i[index]

  # Routes pour la chatroom: voir le chat avec un autre utilisateur

  resources :chatrooms, only: %i[show]

  # Routes pour les transactions?

  resources :transactions, only: %i[edit update]

  resources :events, only: %i[index]

  # Routes pour les owners: ajout et modification de vetements, voir ses transactions, "Manage" pour s'occuper des
  # des status des de sa transaction

  namespace :owner do
    resources :clothes, only: %i[new create edit update destroy]
    resources :transactions, only: %i[index] do
      patch 'manage'
    end
  end
end
