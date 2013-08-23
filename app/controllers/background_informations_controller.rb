class BackgroundInformationsController < ApplicationController
  before_action :set_background_information, only: [:show, :edit, :update, :destroy]
  #before_action :set_request, except:

  # GET /background_informations
  # GET /background_informations.json
  def index
    @background_informations = BackgroundInformation.all
  end

  # GET /background_informations/1
  # GET /background_informations/1.json
  def show
  end

  # GET /background_informations/new
  def new
    @request = Request.create(user: current_user)
    @background_information = BackgroundInformation.new(request: @request)
  end

  # GET /background_informations/1/edit
  def edit
  end

  # POST /background_informations
  # POST /background_informations.json
  def create
    @background_information = BackgroundInformation.new(background_information_params)

    respond_to do |format|
      if @background_information.save!
        @background_information.request = @request = Request.create(user: current_user)
        @request.save(:validate => false)
        format.html { redirect_to @background_information, notice: 'Background information was successfully created.' }
        format.json { render action: 'show', status: :created, location: @background_information }
      else
        format.html { render action: 'new' }
        format.json { render json: @background_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /background_informations/1
  # PATCH/PUT /background_informations/1.json
  def update
    respond_to do |format|
      if @background_information.update(background_information_params)
        format.html { redirect_to @background_information, notice: 'Background information was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @background_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /background_informations/1
  # DELETE /background_informations/1.json
  def destroy
    @background_information.destroy
    respond_to do |format|
      format.html { redirect_to background_informations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_background_information
      @background_information = BackgroundInformation.find(params[:id])
    end

    def set_request
      @request = Request.find params[:request_id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def background_information_params
      params.require(:background_information).permit(:elevator_pitch, :background_information, :no_list, :what_can_go_wrong, :what_is_it_going_to_give, :what_is_the_frame, :request_id)
    end
end
