Rails.application.routes.draw do
  devise_for :users
  resources :items, only: [:index, :new, :create, :show] do
    collection do
      get :verification
      get :verification_address
      get :credit
    end
  end
  resources :users, only: [:index, :new] do
    collection do
      get :sms
      get :sms_input
      get :completed
    end
  end
  root "items#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
