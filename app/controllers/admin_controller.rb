class AdminController < ApplicationController
    def index
    end

    def writings
        @writings = Writing.all.includes(:user, :writing_conversations)
    end

    def users
    end

    def show_writing
        @writing = Writing.includes(:user, :writing_conversations).find(params[:id])
    end
end
