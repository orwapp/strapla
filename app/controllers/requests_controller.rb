class RequestsController < ApplicationController
  respond_to :html
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  before_action :find_requests
  before_filter :set_wizzard

  def index
  end

  def unassigned_requests
  end

  def my_requests
  end

  def select_type_of_problem
    @request = Request.new(user: current_user)
  end


  def show
    @price_quote = current_user.price_quotes.new  if user_signed_in?
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
      if @wizzard
        redirect_to request_create_many_path(@request) 
      else
        redirect_to select_recipient_path(@request)
      end
    else
      respond_with(@request)
    end
  end

  def select_recipient
    @request = Request.find(params[:request_id])
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
    redirect_to :back, notice: 'Request deleted'
  end

  def publish
    @request = Request.find(params[:request_id])
    @request.update_attribute(:published, true)
    redirect_to root_path, notice: 'Your request is publised'
  end

  private
  def set_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(:title, :description, :goal, :request_group_id, :repository_url)
  end

  def find_requests
    if user_signed_in?
      @unassigned_requests = Request.unassigned.where.not(user_id: @current_user.id) 
      @my_requests = current_user.requests.all
    else
      @unassigned_requests = Request.unassigned
    end
    @groups = @unassigned_requests.all.collect(&:request_group).uniq if @unassigned_requests
  end


  def set_wizzard
    @wizzard ||= params[:wizzard].present? &&  params[:wizzard] == 'true'
  end


end
