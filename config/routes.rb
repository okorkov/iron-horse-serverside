Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'admin#home'

  resources :sessions, only: [:new, :create, :destroy]

  resources :header, only: [:edit]
  resources :about, only: [:edit]
  resources :project_pics, only: [:edit]
  resources :wood_pics, only: [:edit]
  resources :contact, only: [:edit]
  resources :info, only: [:update]

end
