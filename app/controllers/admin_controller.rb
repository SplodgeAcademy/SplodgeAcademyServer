class AdminController < ApplicationController
    def index
    end

    def writings
        @writings = Writing.all.includes(:user)
    end

    def users
    end

    def show_writing
        @writing = Writing.includes(:user, writing_conversations: [ :user, :rich_text_body ]).find(params[:id])
    end
end
