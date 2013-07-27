class PriceQuotesController < ApplicationController
  before_action :set_price_quote, only: [:show, :edit, :update, :destroy]
  before_action :set_request, only: [:new, :edit, :update]
  respond_to :html

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
    flash[:notice] = 'Price quote sent to client' if @price_quote.save!
    @price_quote.send_quote_to_owner
    respond_with(@price_quote.request)
  end

  def accept
    #@price_quote = current_user.price_quotes.find(params[:id])
    @price_quote = PriceQuote.find(params[:id])
    @price_quote.update_attribute(:status, 'accepted')
    UserMailer.inform_about_accepted_quote(@price_quote).deliver
    flash[:notice] = "Price quote accepted. #{@price_quote.user.name} has been notified"
    redirect_to request_price_quote_path(@price_quote.request, @price_quote)
  end

  def update
    respond_to do |format|
      if @price_quote.update(price_quote_params)
        flash[:notice]= 'Price quote was successfully updated.' 
        respond_with(@price_quote.request)
      else
        #format.html { render action: 'edit' }
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
