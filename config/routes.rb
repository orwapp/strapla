CodeRunner::Application.routes.draw do



  resources :feature_requests do
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
    get  'features/review'       => 'features#review',  as: :review,  format: false
    post '/publish'      => 'requests#publish', as: :publish, format: false
    resources :features
    resources :background_informations
    resources :price_quotes
  end
  get  'my_requests/' => 'requests#my_requests', as: :my_requests
  get  'unassigned_requests/' => 'requests#unassigned_requests', as: :unassigned_requests

  resources :request_groups
  resources :pages

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'requests#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get  'user/:id' => 'users#profile', as: :user_profile
  get  'select_recipient/:request_id' => 'requests#select_recipient', as: :select_recipient
  post 'delegate_to_expert/' => 'requests#delegate_to_expert',  as: :delegate_to_expert
  post 'delegate_to_group/' => 'requests#delegate_to_group',  as: :delegate_to_group


end
