Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get 'admin', to: 'products#index'
  resources :home do
    member do
      get :register
    end
  end

  resources :orders do
    member do
      get :list
      get :finish
    end
  end
  resources :visitors
  resources :scheduled_products do
    member do 
      get :list
    end
  end
  resources :schedules
  resources :products
  resources :ordered_products do
    member do 
      get :choose_schedule
      get :list
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
