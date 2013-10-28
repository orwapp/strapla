class UsersController < ApplicationController

  def profile
    @user = User.find(params[:id])
  end

	def edit
	end

  def show
    @user = User.find(params[:id])
    render :profile
  end

	def	browse_experts
    @experts = User.where(role: :expert).load
	end

end
