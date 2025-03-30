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


    # Update User info - Level
    def updateInfo
        if @current_user.update(user_params)
            render json: @current_user, status: :accepted
        else
            render json: @current_user.errors,  status: :unprocessable_entity
        end
    end



    private
    # Only allow a list of trusted parameters through.
    def user_params
        params.require(:user).permit(:level)
    end
end
