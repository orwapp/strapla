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
      redirect_to select_recipient_path(@request)
    else
      respond_with(@request)
    end
  end

  def select_recipient
    @request = Request.find(params[:request_id])
    require 'ostruct'
    prng = Random.new
    @experts = []
    @experts << OpenStruct.new('name' => 'Paul Vixie', 
       'bio' => 'Paul Vixie is an American Internet pioneer, the author of several RFCs and well-known Unix software author.',
       'image' => 'http://upload.wikimedia.org/wikipedia/commons/7/70/Vixie.jpg',
       'average_price' => prng.rand(5.0..9.0).round(2))
    @experts << OpenStruct.new('name' => 'Jon Postel', 
       'bio' => 'Jon Postel was editor of all early Internet standards specifications, such as the Request for Comments (RFC) series. His beard and sandals made him "the most recognizable archetype of an Internet pioneer"',
       'image' => 'http://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Jon_Postel.jpg/150px-Jon_Postel.jpg', 
       'average_price' => prng.rand(5.0..9.0).round(2))
    @experts << OpenStruct.new('name' => 'Richard Stallman', 
       'bio' => 'Stallman launched the GNU Project in September 1983 to create a Unix-like computer operating system composed entirely of free software. ' +
                'In October 1985 he founded the Free Software Foundation.',
       'image' => 'http://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/NicoBZH_-_Richard_Stallman_%28by-sa%29_%285%29.jpg/240px-NicoBZH_-_Richard_Stallman_%28by-sa%29_%285%29.jpg', 
       'average_price' => prng.rand(5.0..9.0).round(2))
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
