class TextMatchingsController < ApplicationController
    before_action :set_text_matching, only: %i[ show edit update destroy ]

    # GET /text_matchings or /text_matchings.json
    def index
        @text_matchings = TextMatching.all
    end

    # GET /text_matchings/1 or /text_matchings/1.json
    def show
    end

    # GET /text_matchings/new
    def new
        @text_matching = TextMatching.new
    end

    # GET /text_matchings/1/edit
    def edit
    end

    # POST /text_matchings or /text_matchings.json
    def create
        @text_matching = TextMatching.new(text_matching_params)

         # Create new reading and associate it with new text matching
         @reading = Reading.new()
         @text_matching.reading = @reading

        respond_to do |format|
            if @text_matching.save
                format.html { redirect_to @text_matching, notice: "Text matching was successfully created." }
                format.json { render :show, status: :created, location: @text_matching }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @text_matching.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /text_matchings/1 or /text_matchings/1.json
    def update
        respond_to do |format|
            if @text_matching.update(text_matching_params)
                format.html { redirect_to @text_matching, notice: "Text matching was successfully updated." }
                format.json { render :show, status: :ok, location: @text_matching }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @text_matching.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /text_matchings/1 or /text_matchings/1.json
    def destroy
        @text_matching.destroy!

        respond_to do |format|
            format.html { redirect_to text_matchings_path, status: :see_other, notice: "Text matching was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_text_matching
        @text_matching = TextMatching.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def text_matching_params
        params.expect(text_matching: [ :title, :para1, :para2, :para3, :para4, :sub1, :sub2, :sub3, :sub4, :reading_id ])
    end
end
