Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  resources :signup do
    collection do
      get 'member'
      get 'phone'
      get 'done' # 登録完了後のページ
    end
  end
  
  get 'users/phone' => 'users#phone' 
  get 'users/signup' => 'users#signup' 
  resources :users do
    member do
      get'profile'
      get'logout'
      get'information'
      get 'buy'
      get 'exhibit_list'
    end
    resources :cards, only: [:index, :new, :create, :delete]
    resources :addresses, only: [:new, :create, :edit, :update]
    resources :pictures
    resources :items do
    #Ajaxで動くアクションのルートを作成
      collection do
        get 'get_category_children', defaults: { format: 'json' }
        get 'get_category_grandchildren', defaults: { format: 'json' }
      end
    end
  end
end
