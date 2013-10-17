class Users::RegistrationsController < Devise::RegistrationsController
	def	edit
		@job = @current_user.jobs.new
	end
end
