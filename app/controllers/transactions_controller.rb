class TransactionsController < ApplicationController
	skip_before_action :authenticate_user!, only: [:new, :create, :success]
  before_action :set_transaction, only: [:show, :edit, :update, :destroy, :success]


  # GET /transactions
  # GET /transactions.json
  def index
		if params[:budget]
			@transactions = Budget.find(params[:budget]).transactions
		elsif params[:time_period]
			@transactions = TimePeriod.find(params[:time_period]).transactions
		else
			@transactions = current_user.garin.current_period.transactions
		end
		@garin = current_user.garin
		respond_to do |format|
			format.html
			format.json
		end
  end


  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
    @garin = current_user.garin
  end

  # GET /transactions/1/edit
  def edit
		@garin = current_user.garin
  end

  # POST /transactions
  # POST /transactions.json
  def create
		@transaction = Transaction.new(transaction_params)
		@transaction.garin = @transaction.budget.garin
    respond_to do |format|
      if @transaction.save
				if @transaction.budget.totaled?
					@transaction.budget.update(current_money: @transaction.budget.current_money - @transaction.money)
					@transaction.budget.time_period.update(current_money:  @transaction.budget.time_period.current_money - @transaction.money )
				else
					@transaction.budget.update(current_money: @transaction.budget.current_money + @transaction.money)
				end
				format.html { redirect_to root_path, notice: 'ההוצאה נרשמה בהצלחה' }
				format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
		money_was = @transaction.money
    respond_to do |format|
      if @transaction.update(transaction_params)
				@transaction.budget.update(current_money: (@transaction.budget.current_money + money_was - @transaction.money))
				@transaction.budget.time_period.update(current_money: (@transaction.budget.time_period.current_money + money_was - @transaction.money) )
        format.html { redirect_to @transaction.budget, notice: 'ההוצאה נרשמה בהצלחה.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
		@garin = current_user.garin
		@time_period = @garin.current_period
		budget = @transaction.budget
		trans_money = @transaction.money
		budget.update(current_money: budget.current_money + trans_money)
		@time_period.update(current_money:  @time_period.current_money + trans_money )
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'ההוצאה נמחקה בהצלחה' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:money, :description, :date, :budget_id, :garin_id, :user_id)
    end
end
