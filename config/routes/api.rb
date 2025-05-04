namespace :api do
    namespace :v1 do
        # User Registrations Route
        scope :users, module: :users do
            post "/", to: "registrations#create", as: :user_registration
        end

        # Writing Routes
        resources :writings

        # Problem Routes
        resources :multiple_choices
        resources :open_clozes
        resources :sentence_transformations
        resources :word_formations

        # User Routes
        get "/users/me", to: "users#me"
        put "users/updateInfo", to: "users#updateInfo"
    end
end

# Scope for API
scope :api do
    scope :v1 do
        use_doorkeeper do
            skip_controllers :authorizations, :applications, :authorized_applications
        end
    end
end
