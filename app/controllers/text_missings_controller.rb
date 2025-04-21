class TextMissingsController < ApplicationController
    before_action :set_text_missing, only: %i[ show edit update destroy ]

    # GET /text_missings or /text_missings.json
    def index
        @text_missings = TextMissing.all
    end

    # GET /text_missings/1 or /text_missings/1.json
    def show
    end

    # GET /text_missings/new
    def new
        @text_missing = TextMissing.new
    end

    # GET /text_missings/1/edit
    def edit
    end

    # POST /text_missings or /text_missings.json
    def create
        @text_missing = TextMissing.new(text_missing_params)

         # Create new reading and associate it with new text missing
         @reading = Reading.new()
         @text_missing.reading = @reading

        respond_to do |format|
            if @text_missing.save
                format.html { redirect_to @text_missing, notice: "Text missing was successfully created." }
                format.json { render :show, status: :created, location: @text_missing }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @text_missing.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /text_missings/1 or /text_missings/1.json
    def update
        respond_to do |format|
            if @text_missing.update(text_missing_params)
                format.html { redirect_to @text_missing, notice: "Text missing was successfully updated." }
                format.json { render :show, status: :ok, location: @text_missing }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @text_missing.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /text_missings/1 or /text_missings/1.json
    def destroy
        @text_missing.destroy!

        respond_to do |format|
            format.html { redirect_to text_missings_path, status: :see_other, notice: "Text missing was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_text_missing
        @text_missing = TextMissing.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def text_missing_params
        params.expect(text_missing: [ :title, :optionA, :optionB, :optionC, :optionD, :optionE, :optionF, :optionG, :body, :reading_id ])
    end
end
