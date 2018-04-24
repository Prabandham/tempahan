Rails.application.routes.draw do
  resources :tables
  resources :shifts
  resources :restaurants
  resources :guests
  get 'reservations/list', to: 'reservations#list'
  post 'reservations/create', to: 'reservations#create'
  post 'reservations/update/:id', to: 'reservations#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
