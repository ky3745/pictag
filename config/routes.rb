Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  get "users/:id/likes" => "users#likes"
  resources :users, only: [:show, :edit, :update]
  resources :posts, only: [:new, :create, :show, :destroy] do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
  end
end