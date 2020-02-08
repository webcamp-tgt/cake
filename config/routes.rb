Rails.application.routes.draw do
  
  root to: 'homes#top'
  get 'homes/about'
  get 'admins/top'
  devise_for :end_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
