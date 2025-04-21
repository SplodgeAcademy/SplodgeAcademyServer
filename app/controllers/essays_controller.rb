class EssaysController < ApplicationController
    before_action :set_essay, only: %i[ show edit update destroy ]

    # GET /essays or /essays.json
    def index
        @essays = Essay.all
    end

    # GET /essays/1 or /essays/1.json
    def show
    end

    # GET /essays/new
    def new
        @essay = Essay.new
    end

    # GET /essays/1/edit
    def edit
    end

    # POST /essays or /essays.json
    def create
        @essay = Essay.new(essay_params)

        # Create new prompt and associate it with new essay
        @prompt = Prompt.new()
        @essay.prompt = @prompt

        respond_to do |format|
            if @essay.save
                format.html { redirect_to @essay, notice: "Essay was successfully created." }
                format.json { render :show, status: :created, location: @essay }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @essay.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /essays/1 or /essays/1.json
    def update
        respond_to do |format|
            if @essay.update(essay_params)
                format.html { redirect_to @essay, notice: "Essay was successfully updated." }
                format.json { render :show, status: :ok, location: @essay }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @essay.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /essays/1 or /essays/1.json
    def destroy
        @essay.destroy!

        respond_to do |format|
            format.html { redirect_to essays_path, status: :see_other, notice: "Essay was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_essay
        @essay = Essay.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def essay_params
        params.expect(essay: [ :situation, :task, :note1, :note2, :prompt_id ])
    end
end
