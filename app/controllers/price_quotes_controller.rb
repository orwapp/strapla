class PriceQuotesController < ApplicationController
  before_action :set_price_quote, only: [:show, :edit, :update, :destroy]
  before_action :set_request, only: [:new, :create]
  respond_to :html
  before_filter :authenticate_user!
  before_action :find_requests

  def index
    @unprocessed_price_quotes = @current_user.price_quotes.where(status: nil).to_a
    @accepted_price_quotes    = @current_user.price_quotes.where(status: 'accepted').to_a
    @rejected_price_quotes    = @current_user.price_quotes.where(status: 'rejected').to_a
  end

  def show
    # TODO Add cancan
		@price_quote = PriceQuote.find(params[:id])
    @comment = Comment.new
  end

  def new
		@existing_price_quote = current_user.price_quotes.where(request_id: params[:request_id]).first
		redirect_to @existing_price_quote if @existing_price_quote.present?
    #@price_quote = PriceQuote.new(request: @request)
    #@comment = Comment.new
  end

  def edit
    @price_quote = PriceQuote.find params[:id]
    @request     = @price_quote.request
  end

  def create
    @price_quote = PriceQuote.new(price_quote_params)
    @price_quote.user = current_user
		@price_quote.request = @request
    if @price_quote.save
      flash[:notice] = 'Price quote sent to client' 
      @price_quote.notify_owner_about_new_quote
      respond_with(@price_quote.request)
    else
      respond_with(@price_quote)
      #redirect_to :back, warning: 'Failed to save'
    end
  end

  def accept
    # TODO Add cancan
    @price_quote = PriceQuote.find(params[:id])
    @price_quote.status = 'accepted'

    @price_quote.request.contractor = @price_quote.user
    @price_quote.save
    @price_quote.notify_expert_about_accept_price_quote

    flash[:notice] = "Price quote accepted. #{@price_quote.user.name} has been notified"
    redirect_to request_path(@price_quote.request)
  end

  def reject
    # TODO Add cancan
    @price_quote = PriceQuote.find(params[:id])
    @price_quote.status = 'rejected'
    @price_quote.save!
    UserMailer.inform_about_rejected_quote(@price_quote).deliver
    flash[:notice] = "Price quote rejected. #{@price_quote.user.name} has been notified"
    redirect_to request_path(@price_quote.request)
  end

  def update
    respond_to do |format|
      if @price_quote.update(price_quote_params)
        flash[:notice]= 'Price quote was successfully updated.' 
        #respond_with(@price_quote.request)
        format.html { redirect_to @price_quote.request}
      else
        format.html { render action: 'edit' }
        #format.json { render json: @price_quote.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @price_quote.destroy
    respond_to do |format|
      format.html { redirect_to price_quotes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_price_quote
      @price_quote = PriceQuote.find(params[:id])
    end

    def set_request
      if params[:request_id].present?
        @request = Request.find params[:request_id]
      else
        @request = Request.find params[:id]
      end
    end

    def price_quote_params
      params.require(:price_quote).permit(:price, :hours_estimated, :description, :request_id)
    end


end
