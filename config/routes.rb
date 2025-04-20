Rails.application.routes.draw do
    # Set up doorkeeper for api user access
    use_doorkeeper

    # Devise Routes for Log In and Registration
    devise_for :users, controllers: {
        sessions: "users/sessions",
        registrations: "users/registrations"
    }

    # Routes for writings
    resources :writings do
        resources :writing_conversations
    end

    # Draw API routes
    draw :api

    # Pages
    get "info", to: "pages#info"
    get "/u/:id", to: "users#profile", as: "user"
    get "search", to: "search#index"
    get "problems", to: "pages#problems"

    # Problem Links
    resources :word_formations
    resources :sentence_transformations
    resources :open_clozes
    resources :multiple_choices

    # Admin routes
    authenticated :user, ->(user) { user.admin? } do
        get "admin", to: "admin#index"
        get "admin/writings"
        get "admin/users"
        get "admin/show_writing/:id", to: "admin#show_writing", as: "admin_writing"
    end

    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
    # Can be used by load balancers and uptime monitors to verify that the app is live.
    get "up" => "rails/health#show", as: :rails_health_check

    # Render dynamic PWA files from app/views/pwa/*
    get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
    get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

    # Defines the root path route ("/")
    root "pages#home"
end
