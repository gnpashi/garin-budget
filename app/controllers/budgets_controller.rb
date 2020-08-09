class BudgetsController < ApplicationController
	load_and_authorize_resource
  before_action :set_budget, only: [:show, :edit, :update, :destroy]

  # GET /budgets
  # GET /budgets.json
  def index
    # @budgets = Budget.all
		@budgets = current_user.garin.budgets
  end

  # GET /budgets/1
  # GET /budgets/1.json
  def show
  end

  # GET /budgets/new
  def new
    @budget = Budget.new
  end


  # GET /budgets/1/edit
  def edit
  end

  # POST /budgets
  # POST /budgets.json
  def create
    @budget = Budget.new(budget_params)
		@budget.garin = current_user.garin
		respond_to do |format|
			if @budget.save
				@budget.garin.new_money
				if params[:create_and_add]
					format.html { redirect_to new_budget_path, notice: 'Budget was successfully created.' }
				else
					format.html { redirect_to @budget.garin, notice: 'Budget was successfully created.' }
				end
			else
				format.html { render :new }
				format.json { render json: @budget.errors, status: :unprocessable_entity }
			end
		end
  end

  # PATCH/PUT /budgets/1
  # PATCH/PUT /budgets/1.json
  def update
    respond_to do |format|
      if @budget.update(budget_params)
				 @budget.garin.new_money
        format.html { redirect_to @budget.garin, notice: 'Budget was successfully updated.' }
        format.json { render :show, status: :ok, location: @budget }
      else
        format.html { render :edit }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /budgets/1
  # DELETE /budgets/1.json
  def destroy
    @budget.destroy
		@budget.garin.new_money
    respond_to do |format|
      format.html { redirect_to @budget.garin, notice: 'Budget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_budget
      @budget = Budget.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def budget_params
      params.require(:budget).permit(:name, :money, :garin_id, :transactions)
    end
end
