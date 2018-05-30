Rails.application.routes.draw do
  root 'welcome#index'
  post 'get_driftmap' => 'api#get_driftmap'

  resources :users,            only: [:new, :create, :edit, :update, :show, :destroy]
  resources :journeys
  resources :waypoints,        only: [:new, :create, :edit, :update, :destroy]
  resources :galleries,        only: [:new, :create, :edit, :update, :destroy ]
  resources :driftmaps,        only: [:edit,:update, :destroy]
  resources :friends,          only: [:new, :create, :edit, :update, :destroy]
  resources :essays,           only: [:new, :create, :edit, :update, :destroy]
  resources :treks,            only: [:new, :create, :edit, :update, :destroy]
  resources :waypoint_images,  only: [:create, :update, :destroy]

  get    'waypoints/content_creation' => 'waypoints#content_creation'
  get    'signup' => 'users#new'
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'ethan', to: redirect('users/1')  
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
end
