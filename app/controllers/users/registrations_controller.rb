class Users::RegistrationsController < Devise::RegistrationsController
	def	edit
		@job = @current_user.jobs.new
		@certification = @current_user.certifications.new
	end

	def	update
		@job = @current_user.jobs.new
		@certification = @current_user.certifications.new
    super
	end
end
