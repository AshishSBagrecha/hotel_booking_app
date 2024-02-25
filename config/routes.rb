Rails.application.routes.draw do
  root 'hotels#index'
  resources :hotels, only: [:index]
  resources :bookings, only: [:edit ,:index, :new, :create, :destroy, :update]
end
