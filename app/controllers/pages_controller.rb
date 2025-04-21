class PagesController < ApplicationController
    def home
    end

    def info
        # Get information about current doorkeeper application
        @application = Doorkeeper::Application.find_by(name: "React")

        @application = {
            name: @application.name,
            client_id: @application.uid,
            client_secret: @application.secret
        }
    end

    def problems
    end

    def listenings
    end

    def readings
    end

    def prompts
    end
end
