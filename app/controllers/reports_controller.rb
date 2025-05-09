class ReportsController < ApplicationController
    before_action :set_report, only: %i[ show edit update destroy ]

    # GET /reports or /reports.json
    def index
        @reports = Report.all.includes([ :prompt ])
    end

    # GET /reports/1 or /reports/1.json
    def show
        @writings = @report.prompt.writings.includes([ :rich_text_body, :user ])
    end

    # GET /reports/new
    def new
        @report = Report.new
    end

    # GET /reports/1/edit
    def edit
    end

    # POST /reports or /reports.json
    def create
        @report = Report.new(report_params)

        # Create new prompt and associate it with new report
        @prompt = Prompt.new()
        @prompt.prompt_type = Prompt.prompt_types[:report]
        @report.prompt = @prompt

        respond_to do |format|
            if @report.save
                format.html { redirect_to @report, notice: "Report was successfully created." }
                format.json { render :show, status: :created, location: @report }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @report.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /reports/1 or /reports/1.json
    def update
        respond_to do |format|
            if @report.update(report_params)
                format.html { redirect_to @report, notice: "Report was successfully updated." }
                format.json { render :show, status: :ok, location: @report }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @report.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /reports/1 or /reports/1.json
    def destroy
        @report.destroy!

        respond_to do |format|
            format.html { redirect_to reports_path, status: :see_other, notice: "Report was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
        @report = Report.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def report_params
        params.expect(report: [ :situation, :task, :prompt_id ])
    end
end
