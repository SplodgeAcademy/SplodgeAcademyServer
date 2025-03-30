class Api::V1::UsersController < ApiController
    before_action :current_user

    # GET /me.json
    # Return Current User data
    def me
        if @current_user.nil?
            # Send error Message if Current User not found
            render json: { error: "Not Authorized" }, status: :unauthorized
        else
            # Return current User
            render json: @current_user
        end
    end
end
