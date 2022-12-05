# require "stripe_event"
Rails.application.routes.draw do
  devise_for :users
  resources :users
  root to: "donation_types#index"
  get "about", to: "about#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  resources :baskets, only: %i[show update create] do
    resources :payments, only: %i[new show]
    resources :basket_items, only: %i[create update]
    # get :checkout, on: :member
  end
  get "/basket_items/unredeemed_items", to: "basket_items#unredeemed_items", as: "unredeemed_items"
  resources :charity_profiles do
    resources :donation_types
  end

  mount StripeEvent::Engine, at: '/stripe-webhooks'
end
