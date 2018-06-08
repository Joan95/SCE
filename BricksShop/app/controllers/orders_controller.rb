class OrdersController < ApplicationController

	def showOrder 
		@order = Order.find(params[:id])
		@orderProducts = @order.order_products
		@totalPrice = @order.totalPrice
	end

	def listOrders
		@orders = Order.where user_id: current_user.id, status: "Ordered"
	end

	def emptyOrder
		@orders = Order.where user_id: current_user.id
	end

	def listCancelledOrders
		@orders = Order.where user_id: current_user.id, status: "Cancelled"
	end

	def cancelOrder
		Order.update(params[:id], :status => "Cancelled")
		redirect_back fallback_location: listOrders_path
	end

end
