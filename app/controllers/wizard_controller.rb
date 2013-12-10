class WizardController < ApplicationController
  before_action :set_request

  def introduction
  end

  def features
  end

  def review
  end

  private
  def set_request
    @request = @current_user.requests.where(id: params[:feature_request_id]).first
  end

  def request_params
    params.require(:elevator_pitch).permit(:text, :request_id)
  end
end
