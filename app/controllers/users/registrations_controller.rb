class Users::RegistrationsController < Devise::RegistrationsController
  before_filter  :set_job_and_certification


	def	edit
		@job = @current_user.jobs.new
		@certification = @current_user.certifications.new
	end

	#def	update
	#	@job = @current_user.jobs.new
	#	@certification = @current_user.certifications.new
  #  redirect_to user_profile_path(@current_user)
	#end
  
  private
  def set_job_and_certification
		@job = @current_user.jobs.new
		@certification = @current_user.certifications.new
  end

end
