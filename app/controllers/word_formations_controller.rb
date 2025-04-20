class WordFormationsController < ApplicationController
    before_action :set_word_formation, only: %i[ show edit update destroy ]

    # GET /word_formations or /word_formations.json
    def index
        @word_formations = WordFormation.all
    end

    # GET /word_formations/1 or /word_formations/1.json
    def show
    end

    # GET /word_formations/new
    def new
        @word_formation = WordFormation.new
    end

    # GET /word_formations/1/edit
    def edit
    end

    # POST /word_formations or /word_formations.json
    def create
        @word_formation = WordFormation.new(word_formation_params)

        # Create new problem and associate it with new word formation
        @problem = Problem.new()
        @word_formation.problem = @problem

        respond_to do |format|
            if @word_formation.save
                format.html { redirect_to @word_formation, notice: "Word formation was successfully created." }
                format.json { render :show, status: :created, location: @word_formation }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @word_formation.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /word_formations/1 or /word_formations/1.json
    def update
        respond_to do |format|
            if @word_formation.update(word_formation_params)
                format.html { redirect_to @word_formation, notice: "Word formation was successfully updated." }
                format.json { render :show, status: :ok, location: @word_formation }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @word_formation.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /word_formations/1 or /word_formations/1.json
    def destroy
        @word_formation.destroy!

        respond_to do |format|
            format.html { redirect_to word_formations_path, status: :see_other, notice: "Word formation was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_word_formation
        @word_formation = WordFormation.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def word_formation_params
        params.expect(word_formation: [ :question, :answer, :keyword ])
    end
end
