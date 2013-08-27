class FeaturesController < ApplicationController
  before_action :set_feature, only: [:show, :edit, :update, :destroy]

  def index
    @features = Feature.all
  end

  def create_many
    @feature = Feature.new
  end

  def show
  end

  def new
    @feature = Feature.new
  end

  def edit
  end

  def create
    @request = Request.find(params[:request_id])
    @feature = Feature.new(feature_params)
    @feature.request = @request

    respond_to do |format|
      if @feature.save!
        format.html { redirect_to @feature, notice: 'Feature was successfully created.' }
        format.json { render action: 'show', status: :created, location: @feature }
      else
        format.html { render action: 'new' }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @feature.update(feature_params)
        format.html { redirect_to @feature, notice: 'Feature was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @feature.destroy
    respond_to do |format|
      format.html { redirect_to features_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feature
      @feature = Feature.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feature_params
      params.require(:feature).permit(:request_id, :text, :title)
    end
end
