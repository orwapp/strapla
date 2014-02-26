class RequestAttachmentsController < ApplicationController
  before_action :set_request_attachment, only: [:show, :edit, :update, :destroy]

  # GET /request_attachments
  # GET /request_attachments.json
  def index
    @request_attachments = RequestAttachment.all
  end

  # GET /request_attachments/1
  # GET /request_attachments/1.json
  def show
  end

  # GET /request_attachments/new
  def new
    @request_attachment = RequestAttachment.new
  end

  # GET /request_attachments/1/edit
  def edit
  end

  # POST /request_attachments
  # POST /request_attachments.json
  def create
    @request_attachment = RequestAttachment.new(request_attachment_params)
    @request_attachment.request_id = params[:request_id]

    respond_to do |format|
      if @request_attachment.save
        format.html { redirect_to @request_attachment, 
          notice: 'Request attachment was successfully created.' }
        format.json { render action: 'show', status: :created, 
          location: @request_attachment }
      else
        format.html { render action: 'new' }
        format.json { render json: @request_attachment.errors, 
          status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /request_attachments/1
  # PATCH/PUT /request_attachments/1.json
  def update
    respond_to do |format|
      if @request_attachment.update(request_attachment_params)
        format.html { redirect_to @request_attachment, 
          notice: 'Request attachment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @request_attachment.errors, 
          status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_attachments/1
  # DELETE /request_attachments/1.json
  def destroy
    @request_attachment.destroy
    respond_to do |format|
      format.html { redirect_to request_attachments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_attachment
      @request_attachment = RequestAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, 
    # only allow the white list through.
    def request_attachment_params
      params.require(:request_attachment).permit(:request_id, :image, 
        :title, :description)
    end
end
