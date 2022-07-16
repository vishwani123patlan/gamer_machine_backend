Rails.application.routes.draw do
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
