class UsersController < ApplicationController
    before_action :set_user
    def profile
    end


    private
    # Set User helper
    def set_user
        @user = User.find(params[:id])
    end
end
