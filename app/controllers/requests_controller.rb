class RequestsController < ApplicationController
  respond_to :html
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  def index
    @requests = Request.unassigned.where.not(user_id: current_user.id)
    @groups   = @requests.all.collect(&:request_group).uniq if @requests
  end

  def select_type_of_problem
  end

  def my_requests
    @requests = current_user.requests.all
    render :index
  end

  def show
    @price_quote = current_user.price_quotes.new
  end

  def new
    @request = Request.new
  end

  def add_features
  end

  def edit
  end

  def create
    @request = Request.new(request_params)
    @request.user = current_user
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
    @request.update_attribute(:contractor, @expert)

    flash[:notice] = "Thank you! #{@expert.name} will contact you shortly." 
    redirect_to root_url
  end

  def delegate_to_group
    flash[:notice] = "The request has been forwarded to our expert group"
    redirect_to root_url
  end

  def update
    if @request.update(request_params)
      flash[:notice]  = 'Request was successfully updated.'
    else
      flash[:warning] = 'Request was NOT updated.'
    end
      respond_with(@request)
  end

  def destroy
    @request = Request.find(params[:id]) 
    @request.destroy 
    respond_with(@request)
  end

  private
  def set_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(:title, :description, :goal, :request_group_id, :repository_url)
  end

end
