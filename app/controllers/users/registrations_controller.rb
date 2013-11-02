class Users::RegistrationsController < Devise::RegistrationsController

  before_filter :set_job_and_certification

	def	edit
	end


	def	set_job_and_certification
    begin
		  @job = @current_user.jobs.new
		  @certification = @current_user.certifications.new
    rescue
    end
	end

  protected

  def after_update_path_for(resource)
    user_path(resource)
  end
end
