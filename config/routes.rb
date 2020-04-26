Rails.application.routes.draw do
  resources :reviews
  resources :categories
  resources :products
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'landings#index'
end
