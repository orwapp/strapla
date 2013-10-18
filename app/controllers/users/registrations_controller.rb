class Users::RegistrationsController < Devise::RegistrationsController
	def	edit
		@job = @current_user.jobs.new
		@certification = @current_user.certifications.new
	end
end
