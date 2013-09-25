class Requests::BuildController < ApplicationController
  include Wicked::Wizard

  steps :background_information, 
    :no_list_what_can_go_wrong,
    :the_frame,
    :select_group,
    :add_features,
    :select_recipient

  def show
    @request = Request.find(params[:request_id])
    case params[:id]
    when 'add_features'
      @feature = Feature.new
    when 'select_recipient'
      @experts = User.where(role: :expert).load
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
       :no_list,
       :what_can_go_wrong,
       :what_is_it_going_to_give,
       :what_is_the_frame
      )
  end

end