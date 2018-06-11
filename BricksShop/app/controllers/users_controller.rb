class UsersController < ApplicationController
	def showUser
		@user = User.find(current_user.id)
	end

	def seeUser
		@user = User.find(params[:id])
	end

	def listAllUsers
		@users = User.all
	end
end
