Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'admin#home'

  resources :sessions, only: [:new, :create, :destroy]

  resources :header
  resources :about
  resources :project_pics
  resources :wood_pics
  resources :contact

end
