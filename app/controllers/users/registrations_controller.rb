class Users::RegistrationsController < Devise::RegistrationsController
	def	edit
		@experience = @current_user.experiences.new
	end
end
