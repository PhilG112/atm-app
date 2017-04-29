Rails.application.routes.draw do
  resources :banks
  resources :customers do
    resources :accounts
  end

  root "home#index"
end

