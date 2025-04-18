class WritingConversationsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_writing


    def create
        # Create writing conversation using params
        @writing_conversation = @writing.writing_conversations.create(writing_conversation_params)
        # Set current user as conversation starter
        @writing_conversation.user = current_user

        # Try to save conversation and redirect back to writing page
        if @writing_conversation.save
            flash[:notice] = "Comment has been created"
            redirect_to writing_path(@writing)
        else
            flash[:alert] = "Comment has not been created"
            redirect_to writing_path(@writing)
        end
    end


    def destroy
        # Set writing conversation to be deleted
        @writing_conversation = @writing.writing_conversations.find(oarams[:id])
        # Delete conversation and redirect back to writing
        @writing_conversation.destroy
        redirect_to writing_path(@writing)
    end


    private
    # Set writing helper
    def set_writing
        @writing = Writing.find(params[:writing_id])
    end

    # Accepted params for writing conversations
    def writing_conversation_params
      params.require(:writing_conversation).permit(:body)
    end
end
