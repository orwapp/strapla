class EstimatedHoursController < ApplicationController
  before_action :set_estimated_hour, only: [:show, :edit, :update, :destroy]

  # GET /estimated_hours
  # GET /estimated_hours.json
  def index
    @estimated_hours = Estimated_hour.all
  end

  # GET /estimated_hours/1
  # GET /estimated_hours/1.json
  def show
  end

  # GET /estimated_hours/new
  def new
    @estimated_hour = Estimated_hour.new
  end

  # GET /estimated_hours/1/edit
  def edit
  end

  # POST /estimated_hours
  # POST /estimated_hours.json
  def create
    @estimated_hour = @current_user.estimated_hours.new(estimated_hour_params)
    @estimated_hour.price_quote_id = params[:price_quote_id] if params[:price_quote_id].present?
    @estimated_hour.feature_id = params[:feature_id] if params[:feature_id].present?

    respond_to do |format|
      if @estimated_hour.save!
        format.html { redirect_to :back, notice: 'Estimated_hour was successfully created.' }
        format.json { render action: 'show', status: :created, location: @estimated_hour }
      else
        format.html { render action: 'new' }
        format.json { render json: @estimated_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estimated_hours/1
  # PATCH/PUT /estimated_hours/1.json
  def update
    respond_to do |format|
      if @estimated_hour.update(estimated_hour_params)
        format.html { redirect_to @estimated_hour, notice: 'Estimated_hour was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @estimated_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estimated_hours/1
  # DELETE /estimated_hours/1.json
  def destroy
    @estimated_hour.destroy
    respond_to do |format|
      format.html { redirect_to estimated_hours_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estimated_hour
      @estimated_hour = Estimated_hour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estimated_hour_params
      params.require(:estimated_hour).permit(:hours, :feature_id)
    end
end

