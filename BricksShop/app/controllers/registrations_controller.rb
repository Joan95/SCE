class RegistrationsController < Devise::RegistrationsController 

	def sign_up_params
		params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :email, :address, :mobile)
	end

	def account_update_params
		params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :email, :address, :mobile, :current_password)
	end

	def edit

	end
end
