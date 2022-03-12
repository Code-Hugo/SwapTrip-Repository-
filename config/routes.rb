Rails.application.routes.draw do
  devise_for :users
  get "my_dashboard", to: "pages#my_dashboard", as: :my_dashboard
  root to: 'flight_tickets#index'
  resources :flight_tickets, only:[:index, :show, :new, :create, :edit, :update] do
    resources :purchases, only: [ :create, :new ]
  end
  resources :purchases , only: [:show]
  get "status/:id", to: "flight_tickets#status", as: :status


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
