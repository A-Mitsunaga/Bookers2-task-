Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :homes, only: [:index]
  resources :books, only: [:create, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:show, :edit, :update, :index]
  get 'home/about' => 'homes#index'

end
