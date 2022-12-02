Rails.application.routes.draw do
  devise_for :users
  resources :users
  root to: "donation_types#index"
  get "about", to: "about#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :baskets do
    resources :basket_items, only: %i[show create destroy]
    get :checkout, on: :member
  end
  resources :charity_profiles do
    resources :donation_types
  end
end
