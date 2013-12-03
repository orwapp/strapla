class RequestsController < ApplicationController
  respond_to :html
  before_action :set_request, only: [:quote, :show, :edit, :update, :destroy, :upload_images]
  before_action :find_requests
  before_filter :set_wizard
  before_filter :authenticate_user!, except: [:index,  :unassigned_requests]

  def index
  end

	def init
	end

  def upload_images
    @image = Image.new
  end

  def select_what_kind_of_software
    @request = Request.find(params[:request_id])
  end

  def unassigned_requests
    @unassigned_requests = Request.published_and_unassigned.to_a
  end

  def quote
    @quote = @current_user.price_quotes.new
    @quote.request = @request
  end

  def my_requests
  end

  def delegated_to_me
    @delegated_requests_not_responded_to = @current_user.delegated_requests_not_responded_to.to_a
    @requests_sent_quote_on              = @current_user.requests_sent_quote_on.to_a - Request.where(contractor_id: @current_user.id).to_a
    @requests_with_accepted_quotes       = Request.where(contractor_id: @current_user.id).to_a
  end

  def select_type_of_problem
    @request = Request.new(user: current_user)
  end

	

  def show
		@request = Request.find(params[:id])
		#raise "found request: #{@request.id}"
		# Redirect the user to the request show page if he has made one.
		if user_signed_in?
			#raise "he is signed in"
			@existing_price_quote = current_user.price_quotes.where(request_id: @request.id).first
			#raise "found existing_price_quote: #{@existing_price_quote}"
			redirect_to @existing_price_quote if @existing_price_quote.present?
		else
			#raise "he is NOT signed in"
		end
		
		@price_quote = current_user.price_quotes.new  if user_signed_in?
		@comment = @price_quote.comments.new          if user_signed_in?
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
    @request.type_of = @wizard.present? ? 'big' : 'small'
    @form_id = "#edit_feature_#{@request.id}"
    if @request.save
      redirect_to "/requests/#{@request.id}/build"
    else
      respond_with(@request)
    end
  end

  def select_recipient
    @request = Request.find(params[:request_id])
    @experts = User.where(role: :expert).load
  end

  def delegate_to_expert
    flash[:notice] = "The request has been forwarded to our expert group"
    @expert  = User.find( params[:delegate_to_expert][:expert_id] )
    @request = Request.find(params[:delegate_to_expert][:request_id])
    @request.update_attribute(:delegated_to_user_id, @expert.id)
    @request.update_attribute(:published, true)
    @request.update_attribute(:status, 'delegated_to_expert')
    @request.save

    flash[:notice] = "Thank you! #{@expert.name} will contact you shortly." 
    redirect_to root_url
  end

  def delegate_to_group
    @request = Request.find(params[:request_id])
    flash[:notice] = "The request has been forwarded to our expert group"
    @request.update_attribute(:published, true)
    @request.update_attribute(:status, 'delegated_to_group')
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
    redirect_to my_requests_path( anchor: 'unpublished_requests' ), notice: 'Request deleted'
  end

  def publish
    @request = Request.find(params[:request_id])
    @request.update_attribute(:published, true)
    redirect_to root_url, notice: 'Your request is publised'
  end

  def unpublish
    @request = Request.find(params[:request_id])
    @request.update_attribute(:published, false)
    redirect_to @request, notice: 'Your request is no longer publised'
  end

  private
  def set_request
    if params[:request_id]
      @request = Request.find(params[:request_id])
    else
      @request = Request.find(params[:id])
    end
  end

  def request_params
    params.require(:request).permit(:title, :description, :goal, 
      :request_group_id, 
      :repository_url, 
      :elevator_pitch,
      :background_information,
      :no_list,
      :what_can_go_wrong,
      :what_is_it_going_to_give,
      :what_is_the_frame,
      :image
    )
  end



  def set_wizard
    @wizard ||= params[:wizard].present? &&  params[:wizard] == 'true'
  end


end
