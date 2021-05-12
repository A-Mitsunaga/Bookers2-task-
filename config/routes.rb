Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:create, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:show, :edit, :update, :index]
  post 'books' => 'books#create'
  get '/books/:id' => 'books#show'
  post 'users/:id' => 'users#show'
  delete '/books/:id' => 'books#destroy'
  post '/books/:id/edit' => 'books#edit'
  put '/books/:id' => 'books#update'

end
