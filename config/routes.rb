Rails.application.routes.draw do

  root to: 'end_users/homes#top'
  get 'homes/about' => 'end_users/homes#about'
  get 'admins/top' => 'admins/homes#top'
  # root to: 'admins#top'
  devise_for :end_users,  :controllers => {
    :sessions => 'end_users/sessions',
    :registrations => 'end_users/registrations'
  }
  devise_for :admins,  :controllers => {
    :sessions => 'admins/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admins do
  	#adminsのルートを下記に書く
    get 'end_user/:id/orders' => 'orders#orders'

  	resources :items, only: [:index, :show, :new, :create, :edit, :update]
    resources :end_users, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_items, only:[:update]
  end

  namespace :end_users do
  	#end_usersのルートを下記に書く
    get 'homes/top'
    get 'homes/about'
    get "genres/:id/items" => "items#genre"
    get "orders/confirm" => "orders#confirm"
    get "orders/thanks" => "orders#thanks"
    get "end_users/unsubscribe"

    resources :end_users, only: [:show, :edit, :update, :destroy]
    resources :orders, only: [:new, :index, :show, :create]
    resources :items, only: [:index, :show]
    resources :shipping_addresses, only: [:index, :create, :edit, :update, :destroy]

    resources :cart_items, only: [:index, :create, :update, :destroy]
    get 'cart_items/empty_cart' => "cart_items#empty_cart"
  end
end

