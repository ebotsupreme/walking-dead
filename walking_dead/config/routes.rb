Rails.application.routes.draw do

  get 'replies/new'

  get 'replies/create'

  get 'replies/edit'

  get 'replies/update'

  get 'replies/destroy'

  #
  # get 'comments/new'
  #
  # get 'comments/create'
  #
  # get 'comments/edit'
  #
  # get 'comments/update'
  #
  # get 'comments/destroy'

  root 'posts#index'

  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'login', to: 'sessions#new'
  resources :sessions, only: [:new, :create, :destroy]

  get 'users' => 'users#index'
  get 'users/new' => 'users#new'
  post 'users' => 'users#create'
  get 'users/:id' => 'users#show', as: :user
  get 'users/:id/edit' => 'users#edit', as: :edit_user
  patch 'users/:id' => 'users#update'

  get 'posts/new' => 'posts#new'
  post 'posts' => 'posts#create'
  get 'posts/:id' => 'posts#show', as: :post
  get 'posts/:id/edit' => 'posts#edit', as: :edit_post
  patch 'posts/:id' => 'posts#update'
  delete 'posts/:id' => 'posts#destroy', as: :delete_post

  delete '/posts/:post_id/comments/:id' => 'comments#destroy', as: :delete_comment
  patch 'comment/:id' => 'comments#update'

  resources :posts, except: [:edit, :update, :destroy] do
    resources :comments, only: [:create, :update, :edit] do
      resources :replies, only: [:create, :update, :edit]
    end
  end



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
