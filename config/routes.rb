Rails.application.routes.draw do
  
  #API ROUTES
  namespace :api do
    namespace :v1 do
      post '/user/sign_in' => 'authentication#sign_in'
      post  '/user/sign_up' => "registrations#sign_up"
      namespace :admin do 
        resources :games, only: [:create, :show, :update, :destroy] 
        resources :tournaments, only: [:create, :show, :update, :destroy]
      end
    end
  end

  #WEB ROUTES
  resources :games
  devise_for :super_admins

  devise_scope :super_admin do 
    authenticated :super_admin do
      root 'games#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
