class TransactionsController < ApplicationController
	skip_before_action :authenticate_user!, only: [:new, :create, :success]
  before_action :set_transaction, only: [:show, :edit, :update, :destroy, :success]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = current_user.garin.transactions
  end
	# def index
	#   respond_to do |format|
	# 		# puts "***************** index ********************"
	# 		# puts TransactionDatatable.new(params)
	# 		format.html
	# 		format.json { render json: TransactionDatatable.new(params) }
	# 		# puts TransactionDatatable.new(params)
	#   end
	# end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
    @garin = Garin.find(params[:garin])
  end

  # GET /transactions/1/edit
  def edit
		@garin = current_user.garin

  end

  # POST /transactions
  # POST /transactions.json
  def create
		@garin = Garin.find(params[:garin])
    @transaction = Transaction.new(transaction_params)
		@transaction.garin = @garin
    respond_to do |format|
      if @transaction.save
				budget = @transaction.budget
				trans_money = @transaction.money
				budget.update(current_money: budget.current_money - trans_money)
				@garin.update(money:  @garin.money - trans_money )
				# @garin.new_money
				if user_signed_in?
					format.html { redirect_to @transaction.garin, notice: 'ההוצאה נרשמה בהצלחה' }
					format.json { render :show, status: :created, location: @transaction }
				else
					format.html { redirect_to success_transaction_path(@transaction), notice: 'ההוצאה נרשמה בהצלחה' }
					format.json { render :show, status: :created, location: @transaction }
				end
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'ההוצאה נרשמה בהצלחה.' }
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
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'ההוצאה נמחקה בהצלחה' }
      format.json { head :no_content }
    end
  end

	def success

	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:person, :money, :description, :date, :budget_id, :garin_id)
    end
end
