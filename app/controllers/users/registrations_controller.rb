class Users::RegistrationsController < Devise::RegistrationsController

	def	edit
		@job = @current_user.jobs.new
		@certification = @current_user.certifications.new
	end



  protected

  def after_update_path_for(resource)
    user_path(resource)
  end
end
