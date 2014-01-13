SampleApp::Application.routes.draw do

  resources :users

  #对动作种类做了限制
  resources :sessions, only: [:new, :create, :destroy]

  match "/signup",  to: "users#new"

  match "/signin", to: "sessions#new"

  #via: :delete 说明要指明用delete请求
  match "/signout", to: "sessions#destroy", via: :delete

  root to: "static_pages#home"

  match "/help", to: "static_pages#help"

  match "/about", to: "static_pages#about"

  match "/contact", to: "static_pages#contact"


end
