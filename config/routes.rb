Rails.application.routes.draw do
  devise_for :users

  root "main#home"

  resources :categories, except: :index
  resources :labours, except: :show
  resources :areas, only: :index
end