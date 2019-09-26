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
    resources :items
  end

  # resources :user do
  #   get 'new_phone_number' on: :member
  # end

end
