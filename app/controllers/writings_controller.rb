class WritingsController < ApplicationController
    before_action :set_writing, only: %i[ show edit update destroy ]
    before_action :authenticate_user!, except: %i[ show index ]

    # GET /writings or /writings.json
    def index
        @writings = Writing.includes(:user, :rich_text_body, :prompt).all.order(created_at: :desc)
    end

    # GET /writings/1 or /writings/1.json
    def show
        @writing_conversations = @writing.writing_conversations.includes(:user, :rich_text_body).order(created_at: :desc)
    end

    # GET /writings/new
    def new
        @writing = Writing.new
    end

    # GET /writings/1/edit
    def edit
    end

    # POST /writings or /writings.json
    def create
        @writing = Writing.new(writing_params)
        @writing.user = current_user

        respond_to do |format|
            if @writing.save
                format.html { redirect_to @writing, notice: "Writing was successfully created." }
                format.json { render :show, status: :created, location: @writing }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @writing.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /writings/1 or /writings/1.json
    def update
        respond_to do |format|
            if @writing.update(writing_params)
                format.html { redirect_to @writing, notice: "Writing was successfully updated." }
                format.json { render :show, status: :ok, location: @writing }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @writing.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /writings/1 or /writings/1.json
    def destroy
        @writing.destroy!

        respond_to do |format|
            format.html { redirect_to writings_path, status: :see_other, notice: "Writing was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_writing
        @writing = Writing.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def writing_params
        params.expect(writing: [ :title, :body ])
    end
end
