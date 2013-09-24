class RequestStepsController < ApplicationController
  include Wicked::Wizard

  steps :background_information, 
    :no_list_what_can_go_wrong,
    :the_frame,
    :select_group

  
  def show
    @request = Request.find(params[:request])
    render_wizard
  end

  def update
    @request = Request.find(params[:id])
    @request.update_attributes(request_params)
    render_wizard @request
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
       :what_is_the_frame
      )
  end

end
