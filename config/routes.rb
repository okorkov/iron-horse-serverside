Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'admin#home'

  resources :sessions, only: [:new, :create, :destroy]

  resources :header, only: [:edit, :update]
  resources :about, only: [:edit, :update]
  resources :project_pics, only: [:edit, :update]
  resources :wood_pics, only: [:edit, :update]
  resources :contact, only: [:edit, :update]

end
