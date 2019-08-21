Rails.application.routes.draw do
  root 'static_pages#index'
  get 'users/new'
  post 'users/create'
  get 'user/:id' => 'users#show', as: 'user'
  get 'sessions/new'
  post 'sessions/create'
  delete 'sessions/destroy'
  resources :events, only: %i[index new show]
  post 'events/create'
end
