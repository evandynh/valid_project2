Rails.application.routes.draw do

  resources :users do
    resources :posts do
      resources :comments
    end
  end

  root 'users#new'

#------------Login Routes--------------
  get '/login'     => 'sessions#new'
  post '/login'    => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
#------------User Routes-------------
  # get 'users' => 'users#index'
  #
  # get 'users/new' => 'users#new', as: :new_user
  # post 'users' => 'users#create'
  #
  # get 'users/:id/edit' => 'users#edit', as: :edit_user
  # patch 'users/:id' => 'users#update'
  #
  # get 'users/:id' => 'users#show', as: :user
  #
  # delete 'users/:id' => 'users#destroy'

  #-----------Posts Routes-------------


  # get 'users/:user_id/posts' => 'posts#index'
  #
  # get 'users/:user_id/posts/new' => 'posts#new', as: :new_post
  # post 'users/:user_id/posts' => 'posts#create'
  #
  # get 'users/:user_id/posts/:id/edit' => 'posts#edit', as: :edit_post
  # patch 'users/:user_id/posts/:id' => 'posts#update'
  #
  # get 'users/:user_id/posts/:id' => 'posts#show', as: :post
  #
  # delete 'users/:user_id/posts/:id' => 'posts#destroy'

  #----------------Comment Routes---------------
  # get 'comments' => 'comments#index'
  #
  # get 'comments/new' => 'comments#new', as: :new_comment
  # post 'comments' => 'comments#create'
  #
  # get 'comments/:id/edit' => 'comments#edit', as: :edit_comment
  # patch 'comments/:id' => 'comments#update'
  #
  # get 'comments/:id' => 'comments#show', as: :comment
  #
  # delete 'comments.:id' => 'comments#destroy'
  #


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
