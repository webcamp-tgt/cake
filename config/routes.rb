Rails.application.routes.draw do

  root to: 'end_users/homes#top'
  get 'homes/about' => 'end_users/homes#about'
  get 'admins/top' => 'admins/homes#top'
  # root to: 'admins#top'
  devise_for :end_users,  :controllers => {
    :registrations => 'end_users/registrations'
  }
  devise_for :admins,  :controllers => {
    :sessions => 'admins/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admins do
  	#adminsのルートを下記に書く
  	resources :items
    resources :end_users
    resources :genres
    resources :orders, only: [:index, :show]
  end

  namespace :end_users do
  	#end_usersのルートを下記に書く
    get 'homes/top'
    get 'homes/about'
    get "genres/:genre_id/items" => "items#index"
    get "items/:id" => "items#show"
    get "orders/confirm" => "orders#confirm"
    get "orders/thanks" => "orders#thanks"
    resources :end_users
    resources :orders
    resources :items
    resources :shipping_addresses

    resources :cart_items, only: [:index, :create, :update, :destroy]
    get 'cart_items/empty_cart' => "cart_items#empty_cart"
  end
end

