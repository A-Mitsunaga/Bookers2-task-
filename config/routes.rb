Rails.application.routes.draw do
  devise_for :users
   root to: 'homes#top'
     resources :books, only: [:create, :index, :show, :destroy, :edit]
     resources :users, only: [:show, :edit, :update, :index]
   post 'books' => 'books#create'
   get '/books/:id' => 'books#show'
    post 'users/:id' => 'users#show'


end
