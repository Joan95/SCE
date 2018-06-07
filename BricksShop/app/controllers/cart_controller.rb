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
		order = Order.create(user_id: current_user.id, totalPrice: session[:products].map{|id| Item.find(id).price}.reduce(:+))
		session[:products].each do |id|
			Order_status_product.create(order_id: order.id, item_id: id, status: "Ordered")
		end
		session[:products].clear
		redirect_to controller: "order", action: "listOrders", id: order.id
	end
end
