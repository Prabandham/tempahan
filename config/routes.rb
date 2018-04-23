Rails.application.routes.draw do
  resources :tables
  resources :shifts
  resources :restaurants
  resources :guests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
