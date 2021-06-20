Rails.application.routes.draw do
  resources :appointments, only: [:index, :create, :update]
  root :to => 'home#index'
end
