Rails.application.routes.draw do
  resources :bookings, only: [:create, :index, :destroy]
end
