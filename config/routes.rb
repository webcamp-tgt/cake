Rails.application.routes.draw do

  namespace :end_users do
    get 'homes/top'
    get 'homes/about'
  end
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
<<<<<<< HEAD
=======
    resources :items
>>>>>>> 1e329200936770b9c2ad613c4baa3af23693b3ab
  end
end
