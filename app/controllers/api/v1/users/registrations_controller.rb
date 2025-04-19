module Api
    module V1
        module Users
            class RegistrationsController < ApiController
                skip_before_action :doorkeeper_authorize!, only: %i[create]

                # Include Doorkeeper
                include DoorkeeperRegisterable


                def create
                    # Find client app
                    client_app = Doorkeeper::Application.find_by(uid: user_params[:client_id])

                    # Send error message if client app doesnt exist
                    unless client_app
                        return render json: { error: I18n.t("doorkeeper.errors.messages.invalid_client") }, status: :unauthorized
                    end

                    # Store email and password
                    allowed_params = user_params.except(:client_id)

                    # Create new user
                    user = User.new(allowed_params)

                    # Try to save user and render as a response
                    if user.save
                        render json: render_user(user, client_app), status: :ok
                    else
                        render json: { errors: user.errors }, status: :unprocessable_entity
                    end
                end


                private
                # Acceptable params for new user
                def user_params
                    params.permit(:email, :password, :client_id)
                end
            end
        end
    end
end
