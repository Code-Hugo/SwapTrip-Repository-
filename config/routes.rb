Rails.application.routes.draw do
  devise_for :users
  get "my_dashboard", to:"pages#my_dashboard", as: :my_dashboard
  root to: 'flight_tickets#index'
  resources :flight_tickets, only:[:index, :show, :new, :create, :edit, :update]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
