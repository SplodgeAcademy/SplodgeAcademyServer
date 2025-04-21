class ReadingQuestionsController < ApplicationController
  before_action :set_reading_question, only: %i[ show edit update destroy ]

  # GET /reading_questions or /reading_questions.json
  def index
    @reading_questions = ReadingQuestion.all
  end

  # GET /reading_questions/1 or /reading_questions/1.json
  def show
  end

  # GET /reading_questions/new
  def new
    @reading_question = ReadingQuestion.new
  end

  # GET /reading_questions/1/edit
  def edit
  end

  # POST /reading_questions or /reading_questions.json
  def create
    @reading_question = ReadingQuestion.new(reading_question_params)

    respond_to do |format|
      if @reading_question.save
        format.html { redirect_to @reading_question, notice: "Reading question was successfully created." }
        format.json { render :show, status: :created, location: @reading_question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reading_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reading_questions/1 or /reading_questions/1.json
  def update
    respond_to do |format|
      if @reading_question.update(reading_question_params)
        format.html { redirect_to @reading_question, notice: "Reading question was successfully updated." }
        format.json { render :show, status: :ok, location: @reading_question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reading_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reading_questions/1 or /reading_questions/1.json
  def destroy
    @reading_question.destroy!

    respond_to do |format|
      format.html { redirect_to reading_questions_path, status: :see_other, notice: "Reading question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reading_question
      @reading_question = ReadingQuestion.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def reading_question_params
      params.expect(reading_question: [ :question, :answer, :optionA, :optionB, :optionC, :optionD, :reading_id ])
    end
end
