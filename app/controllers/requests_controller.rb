class RequestsController < ApplicationController
  respond_to :html, :json
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  def index
    @requests = Request.all
  end

  def show
  end

  def new
    @request = Request.new
  end

  def edit
  end

  def create
    @request = Request.new(request_params)
    if @request.save 
      render :select_recipient
    else
      respond_with(@request)
    end
  end

  def select_recipient
    require 'ostruct'
    @experts = []
    @experts << OpenStruct.new('name' => 'Paul Vixie', 
       'bio' => 'Paul Vixie is an American Internet pioneer, the author of several RFCs and well-known Unix software author.',
       'image' => 'http://upload.wikimedia.org/wikipedia/commons/7/70/Vixie.jpg')
  end

  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @request = Request.find(params[:id]) 
    @request.destroy 
    respond_with(@request)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:subject, :description, :goal, :request_group_id)
    end

end
