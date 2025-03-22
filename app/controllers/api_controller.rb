class ApiController < ApplicationController
    # Authenticate user
    before_action :doorkeeper_authorize!
    skip_before_action :verify_authenticity_token

    # Set response type
    respond_to :json

    # Helper method to assess the current user based on the token
    def current_user
        @current_user ||= User.find_by(id: doorkeeper_token[:resource_owner_id])
    end
end
