Rails.application.routes.draw do
  resources :banks
  resources :customers do
    resources :accounts do
      resources :transactions
    end
  end

  root "home#index"
end

