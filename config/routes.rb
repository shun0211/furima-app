Rails.application.routes.draw do
  resources :items, only: [:index, :show]
  resources :users, only: [:index]
  root "items#index"
  get 'welcome/index'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
