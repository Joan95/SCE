class OrdersController < ApplicationController

	def showOrder 
		@order = Order.find(params[:id])
		@orderProducts = @order.order_products
		@totalPrice = @order.totalPrice
	end

	def listOrders

	end

	def emptyOrder

	end
end
