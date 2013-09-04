class PriceQuotesController < ApplicationController
  before_action :set_price_quote, only: [:show, :edit, :update, :destroy]
  before_action :set_request, only: [:new, :edit, :update, :show]
  respond_to :html
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @price_quotes = PriceQuote.all
  end

  def show
  end

  def new
    @price_quote = PriceQuote.new
  end

  def edit
  end

  def create
    @price_quote = PriceQuote.new(price_quote_params)
    @price_quote.user = current_user
    if @price_quote.save!
      flash[:notice] = 'Price quote sent to client' 
      @price_quote.notify_owner_about_new_quote
      respond_with(@price_quote.request)
    else
      redirect_to :back, warning: 'Failed to save'
    end
  end

  def accept
    # TODO Add cancan
    @price_quote = PriceQuote.find(params[:id])
    @price_quote.update_attribute(:status, 'accepted')
    @price_quote.save!

    @price_quote.request.contractor = @price_quote.user
    @price_quote.save
    @price_quote.notify_expert_about_accept_price_quote

    flash[:notice] = "Price quote accepted. #{@price_quote.user.name} has been notified"
    redirect_to request_path(@price_quote.request)
  end

  def reject
    # TODO Add cancan
    @price_quote = PriceQuote.find(params[:id])
    @price_quote.update_attribute(:status, 'rejected')
    @price_quote.save!
    #raise "PriceQuote is #{@price_quote.inspect}"
    UserMailer.inform_about_rejected_quote(@price_quote).deliver
    flash[:notice] = "Price quote rejected. #{@price_quote.user.name} has been notified"
    redirect_to request_path(@price_quote.request)
  end

  def update
    respond_to do |format|
      if @price_quote.update(price_quote_params)
        flash[:notice]= 'Price quote was successfully updated.' 
        respond_with(@price_quote.request)
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
      @request = Request.find params[:request_id]
    end

    def price_quote_params
      params.require(:price_quote).permit(:price, :hours_estimated, :comment, :request_id)
    end
end
