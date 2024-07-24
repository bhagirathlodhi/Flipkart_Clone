Rails.application.routes.draw do
  devise_for :users
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?




  root "categories#index"

  resources :categories do
    resources :products 
  end

  resources :bookings, only: [:show, :create]
  get "/my_bookings", to: "bookings#my_bookings"
  post "/payment_completed", to: "bookings#payment_completed"
end
