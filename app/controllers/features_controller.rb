class FeaturesController < ApplicationController
  #before_action :set_feature, only: [:show, :edit, :update, :destroy]
  before_action :set_feature, only: [:show, :edit, :update, :destroy]

  def index
    @features = Feature.load.to_a
  end

  def create_many
    @request = Request.find(params[:request_id])
    @feature = Feature.new
  end

  def show
  end

  def new
    @feature = Feature.new
  end

  def edit
  end

  def review
    @review = true
    @request = Request.find params[:request_id]
  end

  def create
    @request = Request.find(params[:request_id])
    @feature = Feature.new(feature_params)
    @feature.request = @request
    @form_id = "#new_feature"  #params[:form_id]

    respond_to do |format|
      if @feature.save
        format.html { redirect_to @feature, notice: 'Feature was successfully created.' }
        #format.json { render action: 'show', status: :created, location: @feature }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def update
    respond_to do |format|
    @form_id = "#edit_feature_#{params[:id]}"
      if @feature.update(feature_params)
        format.html { redirect_to request_review_path(@feature.request), 
          notice: 'Feature was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: 'edit' }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def destroy
    @feature.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feature
      if params[:id].present?
        @feature = Feature.find(params[:id])
      else
        @feature = Feature.find(params[:features_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feature_params
      params.require(:feature).permit(:request_id, :description, :title, :form_id)
    end
end
