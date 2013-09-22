TodoApp::Application.routes.draw do
  resources :users, only:[:new, :create, :destroy]
  resources :sessions, except:[:destroy]
  root to: 'users#index'
  match "login" , to: "sessions#new", via: "get"
  match "users/profile", to: "users#profile", via: "get"
  match "users/", to: "users#index", via: "get"
  match "sessions/", to: "sessions#destroy", via: "delete", as: "sessions_delete"

  scope(:path => '/users') do
    # the rest of your routes go here
    match "/todos", to: "todos#index", via: "get"
    match "/todos", to: "todos#create", via: "post"
    match "/todos/new", to: "todos#new", via: "get"
    match "/todos/edit", to: "todos#edit", via: "get"
    match "/todos/:id", to: "todos#destroy", as: "destroy_todo", via: "delete"
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
