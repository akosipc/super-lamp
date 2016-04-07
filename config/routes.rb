Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations:      "users/registrations"
  }

  authenticated do
    root to: "home#dashboard", as: :authenticated_root
  end

  root to: "home#index"

  namespace :admin, path: "sanctuary" do
    get "/dashboard", to: "dashboard#index", as: :dashboard
    resources :teams
  end

end
