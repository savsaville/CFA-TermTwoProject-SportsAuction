Rails.application.routes.draw do
  resources :bids
  get 'contact', to: "contact#index"

  post 'contact', to: "contact#mail"

  resources :items do
    resources :auctions, only: [ :create ] do
      resources :bids, only: [ :create ]
    end
    member do
      put :transfer
    end
    resources :charges
    get 'confirmation', to: 'charges#confirmation'
    resources :comments
  end

  resources :conversations do
    resources :messages
  end



  devise_for :users
  root'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
