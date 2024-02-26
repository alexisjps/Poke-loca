Rails.application.routes.draw do
  devise_for :users

  root to: "pokemon#index"

  get "up" => "rails/health#show", as: :rails_health_check

resources :pokemon do
  resources :bookings, only: [:new, :create]
end
  resources :bookings, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
  end
resources :bookings, only: [:destroy]
end
