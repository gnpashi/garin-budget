class TimePeriodsController < ApplicationController
  before_action :set_time_period, only: [:show, :edit, :update, :destroy]

  # GET /time_periods
  # GET /time_periods.json
  def index
    @time_periods = TimePeriod.all
  end

  # GET /time_periods/1
  # GET /time_periods/1.json
  def show
  end

  # GET /time_periods/new
  def new
    @time_period = TimePeriod.new
    @garin = current_user.garin
  end

  # GET /time_periods/1/edit
  def edit
  end

  # POST /time_periods
  # POST /time_periods.json
  def create
    @time_period = TimePeriod.new(time_period_params)
    @time_period.garin_id = params[:garin_id]
    if Garin.find(params[:garin_id]).time_periods.blank?
      @time_period.current_money = @time_period.money
    else
      @time_period.current_money = @time_period.money + TimePeriod.last.current_money
    end
    @time_period.money = @time_period.current_money
      if @time_period.save
        puts "*******************create budegts*********************"
        TimePeriod.last(2).first.budgets.each do |budget|
          new_budget = budget.dup
          new_budget.time_period = @time_period
          if new_budget.adding?
            new_budget.money = new_budget.current_money
          else
            new_budget.money = new_budget.money
            new_budget.current_money = new_budget.money
          end
          new_budget.save
        end
        redirect_to root_path, notice: 'מחזור כלכלי נוצר בהצלחה'
      else
        render :new
      end

  end

  # PATCH/PUT /time_periods/1
  # PATCH/PUT /time_periods/1.json
  def update
    respond_to do |format|
      if @time_period.update(time_period_params)
        format.html { redirect_to @time_period, notice: 'Time period was successfully updated.' }
        format.json { render :show, status: :ok, location: @time_period }
      else
        format.html { render :edit }
        format.json { render json: @time_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_periods/1
  # DELETE /time_periods/1.json
  def destroy
    @time_period.destroy
    respond_to do |format|
      format.html { redirect_to time_periods_url, notice: 'Time period was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_period
      @time_period = TimePeriod.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def time_period_params
      params.require(:time_period).permit(:date, :length, :garin_id, :current_money, :money)
    end
end
