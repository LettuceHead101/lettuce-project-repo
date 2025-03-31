Rails.application.routes.draw do
  # devise_for :users   ## adds functionality

    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    devise_for :users, path: 'auth', controllers: {
      sessions: 'auth/sessions',
      registrations: 'auth/registrations'
    }

    # Rails.application.routes.draw do
    #   devise_for :users, controllers: {
    #     sessions: 'users/sessions'
    #   }
    # end

    get "home" => "home#index"
    get "layouts" => "layouts#index"
    resources :users

    # Define authentication routes
    get "login" => "users#new"  # Login page (signup form)
   

    post "login" => "users#create" # Handles user creation
    delete "logout" => "users#destroy" # Logout action

    # Set login/signup page as the root
    root "users#new"

    # Add namespace for admin


    namespace :admin do
      resources :users do
        resources :user_data
      end
    end

    # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
    # Can be used by load balancers and uptime monitors to verify that the app is live.
    get "up" => "rails/health#show", as: :rails_health_check

    # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
    # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
    # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

    # Defines the root path route ("/")
    # root "posts#index"w"


end
