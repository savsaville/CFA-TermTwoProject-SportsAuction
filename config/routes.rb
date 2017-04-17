Rails.application.routes.draw do
  get 'contact/index'

  get 'contact/mail'

  resources :comments
  devise_for :users
  root'pages#home'

  resources :items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
