Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end


  resources :items, only: [:index, :new, :show, :edit, :destroy] do
    collection do
      get :verification
      get :verification_address
      get :credit
    end
  end
  resources :users, only: [:show, :new] do
    collection do
      get :sms
      get :sms_input
      get :completed
    end
  end
  root "items#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
