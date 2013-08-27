CodeRunner::Application.routes.draw do



  resources :feature_requests do
    get "wizard/introduction"
    get "wizard/features"
    get "wizard/review"
  end

  devise_for :users

  post 'accept_price_quote/:id'  => 'price_quotes#accept', as: :accept_price_quote 
  post 'reject_price_quote/:id'  => 'price_quotes#reject', as: :reject_price_quote 
  get  'requests/select_type_of_problem/' => 'requests#select_type_of_problem', as: :select_type_of_problem 

  resources :price_quotes
  resources :elevator_pitches

  resources :background_informations


  resources :features
  resources :requests do
    get  'features/create_many/' => 'features#create_many', as: :create_many 
    get  'features/review'       => 'features#review', as: :review 
    resources :features
    resources :background_informations
    resources :price_quotes
  end

  resources :request_groups
  resources :pages

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get  'user/:id' => 'users#profile', as: :user_profile
  get  'select_recipient/:request_id' => 'requests#select_recipient', as: :select_recipient
  get  'my_requests/' => 'requests#my_requests', as: :my_requests
  post 'delegate_to_expert/' => 'requests#delegate_to_expert',  as: :delegate_to_expert
  post 'delegate_to_group/' => 'requests#delegate_to_group',  as: :delegate_to_group



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
