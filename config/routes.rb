Rails.application.routes.draw do
  # devise_for :users
  # # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # # Defines the root path route ("/")
  # # root "articles#index"
  # root "users#index"
  # # root "user#sign_up"
  
  # resources :users  
 
  # devise_for :users
  
  # resources :users, only: [:show] do
  #   member do
  #     post :send_friend_request
  #     post :accept_friend_request
  #   end
  # end

  # resources :posts, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  # root 'posts#index'

  get 'comments/create'
  get 'comments/destroy'
  get 'likes/create'
  get 'likes/destroy'
  devise_for :users
  # resources :users, only: [:index, :show]

  root to: "users#index"

  resources :friendships, only: [:create] do
    member do
      post :accept
    end
  end

  resources :posts, only: [:index, :create, :new] do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy, :new] 
  end

end
