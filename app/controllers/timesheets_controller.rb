class TimesheetsController < ApplicationController
  # GET /timesheets or /timesheets.json
  def index
    @timesheets = Timesheet.all.order_by_date
  end

  # GET /timesheets/new
  def new
    @timesheet = Timesheet.new
  end


  # POST /timesheets or /timesheets.json
  def create
    @timesheet = Timesheet.new(timesheet_params)

    respond_to do |format|
      if @timesheet.save
        SyncEntryWorkingPriceJob.perform_later(@timesheet)
        format.html { redirect_to timesheets_path, notice: "Timesheet was successfully created." }
        format.json { render :show, status: :created, location: @timesheet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @timesheet.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def timesheet_params
      params.require(:timesheet).permit(:date_of_entry, :start_time, :finish_time)
    end
end
