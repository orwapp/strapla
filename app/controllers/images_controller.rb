class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  def index
    @images = Image.all
  end

  def show
  end

  def new
    @image = Image.new
  end

  def edit
  end

  def create
    @request = Request.find params[:request_id] rescue nil 
    @feature = Feature.find params[:feature_id] rescue nil

    @image = @request.images.new(image_params) if @request.present?
    @image = @feature.images.new(image_params) if @feature.present?

    @return_to_page = params[:image][:return_to_page]
    @wizard = @return_to_page.match 'build'

    respond_to do |format|
      if @image.save
        format.html { redirect_to @return_to_page,
          notice: 'Image was successfully created.' }
        format.js
      else
        flash.now.alert = "Could not save: #{@image.errors.full_messages.join(', ')}"
        if @wizard 
          format.html { render "/requests/#{@request.id}/build/upload_images" }
        else
          format.html { render "/requests/upload_images"}
        end
        format.json { render json: @image.errors.full_messages, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:image, :title, :description, :return_to_page)
    end
end
