Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  
  get 'users/phone' => 'users#phone' 
  get 'users/signup' => 'users#signup' 
  resources :users, only: [:show] do
    member do
      get'profile'
      get'logout'
      get'information'
      get 'buy'
      get 'exhibit_list'
    end
    resources :cards, only: [:index, :new, :create, :delete]
    resources :addresses, only: [:new, :create, :edit, :update]
    resources :items do
    #Ajaxで動くアクションのルートを作成
      collection do
        get 'get_category_children', defaults: { format: 'json' }
        get 'get_category_grandchildren', defaults: { format: 'json' }
      end
    end

  # resources :user do
  #   get 'new_phone_number' on: :member
  # end
  
  end
end
