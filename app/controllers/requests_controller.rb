class RequestsController < ApplicationController
  respond_to :html, :json
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  def index
    @requests = Request.unassigned
    @groups   = @requests.all.collect(&:request_group).uniq if @requests
  end

  def my_requests
    @requests = current_user.requests.all
    render :index
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
    @experts = User.all
  end

  def delegate_to_expert
    flash[:notice] = "The request has been forwarded to our expert group"
    @expert  = User.find( params[:delegate_to_expert][:expert_id] )
    @request = Request.find(params[:delegate_to_expert][:request_id])
    @request.update_attribute(:user, @expert)

    flash[:notice] = "Thank you! #{@expert.name} will contact you shortly." 
    redirect_to root_url
  end

  def delegate_to_group
    flash[:notice] = "The request has been forwarded to our expert group"
    redirect_to root_url
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
