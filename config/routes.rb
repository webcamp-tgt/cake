Rails.application.routes.draw do
  
  root to: 'end_users/homes#top'
  get 'homes/about'
  get 'admins/top'
  devise_for :end_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admins do
  	#adminsのルートを下記に書く
  	resources :items
  end

  namespace :end_users do
  	#end_usersのルートを下記に書く
  end
end
