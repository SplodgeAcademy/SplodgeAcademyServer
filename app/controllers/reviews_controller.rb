class ReviewsController < ApplicationController
    before_action :set_review, only: %i[ show edit update destroy ]

    # GET /reviews or /reviews.json
    def index
        @reviews = Review.all.includes([ :prompt ])
    end

    # GET /reviews/1 or /reviews/1.json
    def show
        @writings = @review.prompt.writings.includes([ :rich_text_body, :user ])
    end

    # GET /reviews/new
    def new
        @review = Review.new
    end

    # GET /reviews/1/edit
    def edit
    end

    # POST /reviews or /reviews.json
    def create
        @review = Review.new(review_params)

        # Create new prompt and associate it with new review
        @prompt = Prompt.new()
        @prompt.prompt_type = Prompt.prompt_types[:review]
        @review.prompt = @prompt

        respond_to do |format|
            if @review.save
                format.html { redirect_to @review, notice: "Review was successfully created." }
                format.json { render :show, status: :created, location: @review }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @review.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /reviews/1 or /reviews/1.json
    def update
        respond_to do |format|
            if @review.update(review_params)
                format.html { redirect_to @review, notice: "Review was successfully updated." }
                format.json { render :show, status: :ok, location: @review }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @review.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /reviews/1 or /reviews/1.json
    def destroy
        @review.destroy!

        respond_to do |format|
            format.html { redirect_to reviews_path, status: :see_other, notice: "Review was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
        @review = Review.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def review_params
        params.expect(review: [ :title, :task, :prompt_id ])
    end
end
