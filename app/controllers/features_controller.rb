class FeaturesController < ApplicationController
  #include Wicked::Wizard
  before_action :set_feature, only: [:show, :edit, :update, :destroy]
  before_action :set_request, only: [:index, :create_many, :new, :create, :review]

  #steps


  def index
    @features = @request.features.order(:priority).load
  end

  def create_many
    @feature = Feature.new
  end

  def show
  end


  def new
    @feature = Feature.new
    @return_to_page = request_features_path(@request)
  end

  def edit
  end

  def review
    @review = true
  end

  def create
    @feature = Feature.new(feature_params)
    @feature.request = @request
    @form_id = "#new_feature"
    @return_to_page = params[:feature][:return_to_page].present? ? params[:feature][:return_to_page] :  "/requests/#{params[:request_id]}/build/features"

    respond_to do |format|
      if @feature.save
        format.html { redirect_to @return_to_page,
          notice: 'Feature was successfully created.' }
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
    @return_to_page = params[:feature][:return_to_page].present? ? params[:feature][:return_to_page] :  "/requests/#{params[:request_id]}/build/features"
      if @feature.update(feature_params)
        format.html { redirect_to @return_to_page,
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

    def set_request
      @request = Request.find(params[:request_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feature_params
      params.require(:feature).permit(:request_id, :description, :title, :form_id, :image, :return_to_page)
    end
end
