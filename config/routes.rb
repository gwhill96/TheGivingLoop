Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :baskets do
    resources :basket_items
  end
  rersources :charity_profiles do
    resources :donation_types
  end
end
