Rails.application.routes.draw do
  root 'static_pages#index'
  get 'users/new'
  post 'users/create'
  get 'users/show'
end
