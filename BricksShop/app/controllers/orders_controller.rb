class OrdersController < ApplicationController

	def listOrders 
		@order = Order.find(params[:id].to_i)
		@orderStatusProdcuts = @order.order_status_products
	end
end
