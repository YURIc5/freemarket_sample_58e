Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'items#index'

  get 'users/phone' => 'users#phone' 
  resources :users, only: [:show] do
    member do
      get'profile'
    end
    resources :cards, only: [:index, :new, :create, :delete]
  end

  # resources :user do
  #   get 'new_phone_number' on: :member
  # end

end
