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
  resources :admin, only: [:index]
  resources :users, only: [:create]

  delete '/admin/delete_images_projects/:id', to: 'admin#delete_collections_projects', as: 'delete_image_attachment_collections_projects'
  delete '/admin/delete_images_wood/:id', to: 'admin#delete_collections_wood', as: 'delete_image_attachment_collections_wood'

  match "*any", via: :all, to: "errors#not_found"
  
end
