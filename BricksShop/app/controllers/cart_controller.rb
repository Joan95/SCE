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

	def orderPayment
		if (session[:products].length > 0)
			order = Order.create(user_id: current_user.id, totalPrice: session[:products].map{|id| Item.find(id).price}.reduce(:+), status: "Ordered")
			session[:products].each do |id|
				OrderProduct.create(order_id: order.id, items_id: id)
			end
			session[:products].clear
			redirect_to controller: "orders", action: "showOrder", id: order.id
		else 
			redirect_to controller: "orders", action: "emptyOrder"
		end
	end
end
