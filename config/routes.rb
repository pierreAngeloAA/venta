Rails.application.routes.draw do
  devise_for :users

  root "main#home"

  resources :categories, except: :index
  resources :labours, except: :show
  resources :areas, only: :index
  resources :skills
  resources :clients

  resources :technicians do
    put :add_skill, on: :member
    delete :delete_skill, on: :member
  end
  
  resources :services do
      put :add_labour, on: :member
      delete :delete_labour, on: :member
  end  
end