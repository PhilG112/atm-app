Rails.application.routes.draw do
  get "/login" => "session#new"
  post "/login" => "session#create"
  delete "/logout" => "session#destroy"

  get "/register" => "customers#new"

  resources :customers do
    resources :accounts
  end

  root "session#new"
end

