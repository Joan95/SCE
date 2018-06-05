class UsersController < ApplicationController
	def showUser
		@user = User.find(current_user.id)
	end
end
