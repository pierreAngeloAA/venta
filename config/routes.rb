Rails.application.routes.draw do
  devise_for :users

  root "main#home"

  resources :categories, except: :index
  resources :areas, only: :index
end
