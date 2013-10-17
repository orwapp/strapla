class RequestGroupsController < ApplicationController
  before_action :set_request_group, only: [:show, :edit, :update, :destroy]

  # GET /request_groups
  # GET /request_groups.json
  def index
    @request_groups = RequestGroup.all
  end

  # GET /request_groups/1
  # GET /request_groups/1.json
  def show
  end

  # GET /request_groups/new
  def new
    @request_group = RequestGroup.new
  end

  # GET /request_groups/1/edit
  def edit
  end

  # POST /request_groups
  # POST /request_groups.json
  def create
    @request_group = RequestGroup.new(request_group_params)

    respond_to do |format|
      if @request_group.save
        format.html { redirect_to @request_group, 
											notice: 'Request group was successfully created.' }
        format.json { render action: 'show', status: :created, 
											location: @request_group }
      else
        format.html { render action: 'new' }
        format.json { render json: @request_group.errors, 
											status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /request_groups/1
  # PATCH/PUT /request_groups/1.json
  def update
    respond_to do |format|
      if @request_group.update(request_group_params)
        format.html { redirect_to @request_group, 
											notice: 'Request group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @request_group.errors, 
											status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_groups/1
  # DELETE /request_groups/1.json
  def destroy
    @request_group.destroy
    respond_to do |format|
      format.html { redirect_to request_groups_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_group
      @request_group = RequestGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, 
		# only allow the white list through.
    def request_group_params
      params.require(:request_group).permit(:title, :description)
    end
end
