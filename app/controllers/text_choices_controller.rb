class TextChoicesController < ApplicationController
    before_action :set_text_choice, only: %i[ show edit update destroy ]

    # GET /text_choices or /text_choices.json
    def index
        @text_choices = TextChoice.all
    end

    # GET /text_choices/1 or /text_choices/1.json
    def show
        @reading_questions = @text_choice.reading.reading_questions
    end

    # GET /text_choices/new
    def new
        @text_choice = TextChoice.new
    end

    # GET /text_choices/1/edit
    def edit
    end

    # POST /text_choices or /text_choices.json
    def create
        @text_choice = TextChoice.new(text_choice_params)

        # Create new reading and associate it with new text choice
        @reading = Reading.new()
        @text_choice.reading = @reading

        respond_to do |format|
            if @text_choice.save
                format.html { redirect_to @text_choice, notice: "Text choice was successfully created." }
                format.json { render :show, status: :created, location: @text_choice }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @text_choice.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /text_choices/1 or /text_choices/1.json
    def update
        respond_to do |format|
            if @text_choice.update(text_choice_params)
                format.html { redirect_to @text_choice, notice: "Text choice was successfully updated." }
                format.json { render :show, status: :ok, location: @text_choice }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @text_choice.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /text_choices/1 or /text_choices/1.json
    def destroy
        @text_choice.destroy!

        respond_to do |format|
            format.html { redirect_to text_choices_path, status: :see_other, notice: "Text choice was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_text_choice
        @text_choice = TextChoice.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def text_choice_params
        params.expect(text_choice: [ :title, :subtitle, :body, :reading_id ])
    end
end
