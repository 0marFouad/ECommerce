Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :cart_items
  resources :carts
  resources :orders
  resources :reviews
  resources :categories
  resources :products
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'landings#index'
  get '/search' => 'landings#search', :as => 'search_page'
  get '/custom_search' => 'landings#custom_search', :as => 'custom_search_page'
  get '/custom_search_query' => 'landings#view_search', :as => 'custom_search_query'
  post 'product/:id/rate' => 'products#rate', :as => 'rate_product'
end
