Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end
  
  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    collection do
      get 'get_category_children', defaults: {format: 'json'}
      get 'get_category_grandchildren', defaults: {format: 'json'}
      # 商品編集の際に画像を削除した際、動くメソッドを定義
      delete 'image_delete', defoults: {format: 'json'}
    end
  end
  
  resources :users, only: [:show, :new] do
    collection do
      get :sms
      get :sms_input
      get :completed
    end
    member do
      get "/credit_cards/:id/new" => "credit_card#new"
    end
  end
  
  resources :purchases, only: [:show] do
    member do
      get :verification_address
      post :create
      post "/credit_cards/:id/create" => "credit_card#create"
      get "pay", to: "purchases#pay"
      post "buy", to: "purchases#buy"
    end
  end
  resources :credit_cards, only: [:index] do
    member do
      get :new
      post :create
      post "delete", to: "credit_cards#delete"
    end
  end

  root "items#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
