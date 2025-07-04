Rails.application.routes.draw do
  devise_for :users

  root "main#home"

  resources :categories, except: :index
  resources :labours, except: :show
  resources :areas, only: :index
  resources :skills
  resources :technicians do
    put :add_skill, on: :member
    delete :delete_skill, on: :member
  end
end