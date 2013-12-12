class Requests::BuildController < ApplicationController
  include Wicked::Wizard
    ##:upload_images,
    #:image_preview,
    #:system_description,

  steps  \
    :upload_images,
    :select_what_kind_of_software,
    :select_language_or_framework,
    :the_frame,
    :features,
    #:create_a_test,
    :review,
    :select_recipient

	# All the steps are handled here
  def show
    @request = Request.find(params[:request_id])
    case params[:id]
    when 'features'
      #@new_feature = Feature.new
      @features = []
      @features << @request.features.new
      @features = @request.features.load
      @features.reverse!
    when 'select_recipient'
      @experts = User.where(role: :expert).load
    when 'select_what_kind_of_software'
      @software_groups = RequestGroup.all
    when 'upload_images'
      @image = @request.images.new
    when 'image_preview'
      @images = [@request.images]
    else
    end
      render_wizard
  end


  def update
    @request = Request.find(params[:request_id])
    @request.update_attributes(request_params)
    render_wizard @request
  end


  def create
    @request = Request.create
    redirect_to wizard_path(steps.first, :request_id => @request.id)
  end



  def request_params
    params.require(:request).permit(:title, :description, :goal, 
       :request_group_id, 
       :preferred_language_id,
       :repository_url, 
       :elevator_pitch,
       :background_information,
       :what_can_go_wrong,
       :what_is_it_going_to_give,
       :what_is_the_frame
      )
  end

end
