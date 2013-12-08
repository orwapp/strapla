class UsersController < ApplicationController
  respond_to :html

  before_filter :find_requests

  def profile
    @user = User.find(params[:id])
  end

  def complete_your_profile
  end

  def edit_developer_profile
  end

  def edit_employer_profile
  end

  def update
    if @current_user.update(request_params)
      flash[:notice]  = 'Changes saved!'
    else
      flash[:warning] = 'Failed to save the changes!'
    end
      respond_with(@current_user)
  end
    

  def show
    @user = User.find(params[:id])
    render :profile
  end

	def	browse_experts
    @experts = User.developer.load
	end


  private

  def request_params
    params.require(:user).permit(:title, :name, :goal, :phone, :developer, :company_name, :developer )
  end
end
