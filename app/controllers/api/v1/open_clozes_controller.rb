class Api::V1::OpenClozesController < ApiController
  before_action :set_open_cloze, only: %i[ show edit update destroy ]

  # GET /open_clozes or /open_clozes.json
  def index
      @open_clozes = OpenCloze.all
      render json: @open_clozes
  end

  # GET /open_clozes/1 or /open_clozes/1.json
  def show
  end

  # GET /open_clozes/new
  def new
      @open_cloze = OpenCloze.new
  end

  # GET /open_clozes/1/edit
  def edit
  end

  # POST /open_clozes or /open_clozes.json
  def create
      @open_cloze = OpenCloze.new(open_cloze_params)

      # Create new problem and associate it with new open cloze
      @problem = Problem.new()
      @open_cloze.problem = @problem

      respond_to do |format|
          if @open_cloze.save
              format.html { redirect_to @open_cloze, notice: "Open cloze was successfully created." }
              format.json { render :show, status: :created, location: @open_cloze }
          else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @open_cloze.errors, status: :unprocessable_entity }
          end
      end
  end

  # PATCH/PUT /open_clozes/1 or /open_clozes/1.json
  def update
      respond_to do |format|
          if @open_cloze.update(open_cloze_params)
              format.html { redirect_to @open_cloze, notice: "Open cloze was successfully updated." }
              format.json { render :show, status: :ok, location: @open_cloze }
          else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @open_cloze.errors, status: :unprocessable_entity }
          end
      end
  end

  # DELETE /open_clozes/1 or /open_clozes/1.json
  def destroy
      @open_cloze.destroy!

      respond_to do |format|
          format.html { redirect_to open_clozes_path, status: :see_other, notice: "Open cloze was successfully destroyed." }
          format.json { head :no_content }
      end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_open_cloze
      @open_cloze = OpenCloze.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def open_cloze_params
      params.expect(open_cloze: [ :question, :answer ])
  end
end
