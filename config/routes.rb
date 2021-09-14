Rails.application.routes.draw do
  resources :ordered_products
  root 'home#index'
  resources :orders
  resources :visitors
  resources :scheduled_products do
    member do 
      get :list
    end
  end
  resources :schedules
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
