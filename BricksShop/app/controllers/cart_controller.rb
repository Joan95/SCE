class CartController < ApplicationController

	def addItem
		(session[:products] ||= []) << params[:id]
		redirect_back fallback_location: root_path
	end

	def removeItem
		(session[:products].delete_at(params[:position].to_i))
		redirect_back fallback_location: root_path
	end

	def emptyCart
		(session[:products] = [])
		redirect_back fallback_location: root_path
	end

	def showCart
		@totalPrice = session[:products].map{|id| Item.find(id).price}.reduce(:+).round(2)
	end

end
