Rails.application.routes.draw do
  resources :orders
  resources :reviews
  resources :categories
  resources :products
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'landings#index'
  get '/search' => 'landings#search', :as => 'search_page'
  post 'product/:id/rate' => 'products#rate', :as => 'rate_product'
end
