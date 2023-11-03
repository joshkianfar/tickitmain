require 'sidekiq/web'

Rails.application.routes.draw do
  resources :items do
    resources :tickets, only: [:create]
  end

  resource :wallet, only: [:show] do
    post :deposit
    post :withdrawal
  end

    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end
  root 'items#index'
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  get 'info', to: 'pages#info'

  get 'entered_raffles', to: 'tickets#entered', as: 'entered_raffles'

  namespace :admin do
    get 'dashboard/index'
    get 'dashboard', to: 'dashboard#index'
  end

end
