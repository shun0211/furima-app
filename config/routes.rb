Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end
  
  resources :items, only: [:index, :new, :create, :show, :edit, :destroy]
  
  resources :users, only: [:show, :new] do
    collection do
      get :sms
      get :sms_input
      get :completed
    end
  end
  
  resources :purchases, only: [:show, :create] do
    collection do
      get :verification_address
      get :purchases_verification
    end
    # 購入機能用です
    # member do
    #   get "pay", to: "purchases#pay"
    #   post "buy", to: "purchases#buy"
    # end
  end
  resources :credit_cards, only: [:index, :new, :create] do
    collection do
      post "delete", to: "credit_cards#delete"
    end
  end

  root "items#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
