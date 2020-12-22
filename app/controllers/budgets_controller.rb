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
		if params[:u]
			@transactions = @budget.transactions.where(user_id: params[:u])
		else
			@transactions = @budget.transactions
		end
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
		@budget.current_money = @budget.money
		@budget.garin = current_user.garin
		@budget.time_period = @budget.garin.current_period
		respond_to do |format|
			if @budget.save
				if params[:create_and_add]
					format.html { redirect_to new_budget_path, notice: 'הקופה נוצרה בהצלחה' }
				else
					format.html { redirect_to @budget.garin, notice: 'הקופה נוצרה בהצלחה' }
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
		@budget.current_money = @budget.money
    respond_to do |format|
      if @budget.update(budget_params)
        format.html { redirect_to @budget.garin, notice: 'הקופה עודכנה בהצלחה' }
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
    respond_to do |format|
      format.html { redirect_to @budget.garin, notice: 'הקופה נמחקה בהצלחה' }
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
      params.require(:budget).permit(:name, :money, :kind, :garin_id, :current_money, :transactions, :is_totaled)
    end
end
