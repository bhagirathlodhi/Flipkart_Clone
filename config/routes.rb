Rails.application.routes.draw do
  get 'search', to: 'search#index'
  devise_for :users
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?




  root "categories#index"

  resources :categories do
    resources :sub_categories do
      resources :products 
    end
  end

  resources :bookings, only: [:show, :create]
  get "/my_bookings", to: "bookings#my_bookings"
  post "/payment_completed", to: "bookings#payment_completed"
end
