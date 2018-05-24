class CartController < ApplicationController
	def addprod
		(session[:products] ||= []) << params[:item]
		redirect_back fallback_location: root_path
	end
end
