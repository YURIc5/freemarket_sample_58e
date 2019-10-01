Rails.application.routes.draw do
  devise_for :users,controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
    }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  resources :signup do
    collection do
      get 'member'
      get 'phone'
      get 'done' # 登録完了後のページ
    end
  end

  resources :items, only: [:index, :new, :show, :edit, :update, :create, :destroy]
  
  get 'users/phone' => 'users#phone' 
  get 'users/signup' => 'users#signup' 
  resources :users do
    member do
      get'profile'
      get'logout'
      get'information'
      get 'exhibit_list'

      
    end
    
    resources :cards, only: [:index,:show, :new, :create, :destroy]
    resources :addresses, only: [:new, :create, :edit, :update]
    resources :pictures
    resources :items, only: [:buy, :pay] do
      member do
        get 'buy'
        post 'pay'
      end
      collection do
        get 'get_category_children', defaults: { format: 'json' }
        get 'get_category_grandchildren', defaults: { format: 'json' }
        get 'get_delivery_children', defaults: { format: 'json' }
      end
    end
  end
end
