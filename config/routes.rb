Rails.application.routes.draw do

  #API ROUTES
  namespace :api do
    namespace :v1 do
      #ADMIN API ROUTES
      namespace :admin do
        resources :games, only: [:index, :create, :show, :update, :destroy] do 
          collection do 
            get :game_types
          end
        end
        resources :tournaments, only: [:index, :create, :show, :update, :destroy]
      end

      post '/user/sign_in' => 'authentication#sign_in'
      post  '/user/sign_up' => "registrations#sign_up"
      resources :teams
      resources :players
      resources :tournament_registrations
      get '/lastest_tournaments' => "tournament_registrations#latest_tournaments"
    end
  end

  #WEB ROUTES
  resources :game_types
  resources :games
  resources :tournaments
  devise_for :super_admins
  devise_scope :super_admin do 
    authenticated :super_admin do
      root 'tournaments#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
