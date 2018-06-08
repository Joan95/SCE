class OrdersController < ApplicationController

	def showOrder 
		@order = Order.find(params[:id])
		@orderProducts = @order.order_products
		@totalPrice = @order.totalPrice
	end

	def listOrders
		@orders = Order.where user_id: current_user.id
	end

	def emptyOrder

	end
end
