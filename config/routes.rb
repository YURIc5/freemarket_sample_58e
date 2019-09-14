Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  resources :users, only: [:show] do
    resources :cards, only: [:index, :new, :create, :delete]
  end
end
