Rails.application.routes.draw do

  root to: 'end_users/homes#top'
  get 'homes/about' => 'end_users/homes#about'
  get 'admins/top'
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
  	resources :items
    resources :end_users
  end

  namespace :end_users do
  	#end_usersのルートを下記に書く
    resources :orders
    get 'homes/top'
    get 'homes/about'
    get "genres/:genre_id/items" => "items#index"
    get "items/:id" => "items#show"
  end
end
