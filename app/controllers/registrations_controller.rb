class RegistrationsController < Devise::RegistrationsController
	private
		super
	def user_params
      params.require(:user).permit(:cover_image)
    end

end