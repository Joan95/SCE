class OrdersController < ApplicationController

	$orderToPay = nil

	def showOrder 
		@order = Order.find(params[:id])
		@orderProducts = @order.order_products
		$totalPrice = @order.totalPrice
		$orderToPay = @order
	end
	
	def getOrderDetails
		@order = Order.find(params[:id])
		@orderProducts = @order.order_products
	end

	def listUserOrders
		@ordersUser = Order.where("user_id LIKE ?", params[:id])
		@user = User.find(params[:id])
	end

	def listOrders
		@orders = Order.where("user_id LIKE ? AND status not LIKE 'Cancelled'", current_user.id)
	end
	
	def listAllOrders
		@allOrders = Order.all
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

	before_action :setPayPalToken, :only => [:createpayment, :executepayment]

	def setPayPalToken
		@paypaltoken = 'A21AAEFo3vYimrKJ3Z93XzP5C0jswqxpEZt_aTNGBqybj2byhWqZyZEnBvUhaYNSMIFRilq0ZOwnlnzwXrEMINKOpfsdkj7Kg'
	end 

	def createpayment
		totalPrice = $totalPrice.round(2)
		@response = HTTParty.post('https://api.sandbox.paypal.com/v1/payments/payment', 
			:headers => { 
				'Content-Type' => 'application/json',
				'Authorization' => "Bearer #{@paypaltoken}"}, 
			:body => { 
				:intent => 'sale', 
				:redirect_urls => {
					'return_url' => 'https://example.com','cancel_url' => 'https://example.com'},
		 	:payer => {
				'payment_method' => 'paypal'}, 
			:transactions => [{'amount' => {'total' => "#{totalPrice}",
                                                                 'currency' => 'EUR'}}]
                      }.to_json, :debug_output => Rails.logger)
		 render json: {
		 	paymentID: "#{@response["id"]}"
		 }.to_json
	end 

	def executepayment
		@response = HTTParty.post("https://api.sandbox.paypal.com/v1/payments/payment/#{params[:paymentID]}/execute/", 
			:headers => { 
				'Content-Type' => 'application/json', 'Authorization' => "Bearer #{@paypaltoken}"}, 
			:body => { 
				:payer_id => "#{params[:payerID]}"
			}.to_json, :debug_output => Rails.logger)

		orderToPay = $orderToPay
		Order.find(orderToPay.id).update(:status => "Paid")
		redirect_to controller: "orders", action: "listOrders"
 	end
end
