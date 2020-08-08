class GarinsController < ApplicationController
  before_action :set_garin, only: [:show, :edit, :update, :destroy]

  # GET /garins
  # GET /garins.json
  def index
    @garins = Garin.all
  end

  # GET /garins/1
  # GET /garins/1.json
  def show
		@garin = current_user.garin if user_signed_in? 
  end

  # GET /garins/new
  def new
    @garin = Garin.new
  end

  # GET /garins/1/edit
  def edit
  end

  # POST /garins
  # POST /garins.json
  def create
    @garin = Garin.new(garin_params)

    respond_to do |format|
      if @garin.save
        format.html { redirect_to @garin, notice: 'Garin was successfully created.' }
        format.json { render :show, status: :created, location: @garin }
      else
        format.html { render :new }
        format.json { render json: @garin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /garins/1
  # PATCH/PUT /garins/1.json
  def update
    respond_to do |format|
      if @garin.update(garin_params)
        format.html { redirect_to @garin, notice: 'Garin was successfully updated.' }
        format.json { render :show, status: :ok, location: @garin }
      else
        format.html { render :edit }
        format.json { render json: @garin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /garins/1
  # DELETE /garins/1.json
  def destroy
    @garin.destroy
    respond_to do |format|
      format.html { redirect_to garins_url, notice: 'Garin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_garin
      @garin = Garin.find(params[:id]) unless user_signed_in? && action_name == "show"
    end

    # Only allow a list of trusted parameters through.
    def garin_params
      params.require(:garin).permit(:name, :money, budgets_ids:[])
    end
end
