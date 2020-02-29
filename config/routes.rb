Rails.application.routes.draw do
  get 'group/new'
  devise_for :users
  root to: 'pages#home'
  resources :bookings, except: [:new, :create] do
    resources :groups, only: [:new, :create]
  end


  resources :restaurants do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings do
    resources :reviews, only: [:new, :create]
  end

  resources :users, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
