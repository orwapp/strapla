class PriceQuotesController < ApplicationController
  before_action :set_price_quote, only: [:show, :edit, :update, :destroy]
  before_action :set_request, only: [:new, :edit, :update]
  respond_to :html

  def index
    @price_quotes = PriceQuote.all
  end

  # GET /price_quotes/1
  # GET /price_quotes/1.json
  def show
  end

  # GET /price_quotes/new
  def new
    @price_quote = PriceQuote.new
  end

  # GET /price_quotes/1/edit
  def edit
  end

  # POST /price_quotes
  # POST /price_quotes.json
  def create
    @price_quote = PriceQuote.new(price_quote_params)

    respond_with(@price_quote.request)
  end

  # PATCH/PUT /price_quotes/1
  # PATCH/PUT /price_quotes/1.json
  def update
    respond_to do |format|
      if @price_quote.update(price_quote_params)
        format.html { redirect_to @price_quote, notice: 'Price quote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @price_quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /price_quotes/1
  # DELETE /price_quotes/1.json
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
      params.require(:price_quote).permit(:price, :hours_estimated, :comment)
    end
end
