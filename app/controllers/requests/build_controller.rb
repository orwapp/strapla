class Requests::BuildController < ApplicationController
  include Wicked::Wizard

  steps  \
    :select_what_kind_of_software,
    :select_language_or_framework,
    :the_frame,
    #:create_a_test,
    :review,
    :select_recipient

	# All the steps are handled here
  def show
    @request = Request.find(params[:request_id])
    case params[:id]
    when 'add_features'
      @feature = Feature.new
    when 'select_recipient'
      @experts = User.where(role: :expert).load
    when 'select_what_kind_of_software'
      @software_groups = RequestGroup.all
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
       :repository_url, 
       :elevator_pitch,
       :background_information,
       :what_can_go_wrong,
       :what_is_it_going_to_give,
       :what_is_the_frame
      )
  end

end
