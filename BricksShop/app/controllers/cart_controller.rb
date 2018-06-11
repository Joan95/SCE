class CartController < ApplicationController

	$totalPrice

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
		$totalPrice = session[:products].map{|id| Item.find(id).price}.reduce(:+)
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
		@paypaltoken = 'A21AAHvRGOWhNNmhY2dKNVYxGUUOzNN1x919Fwv8Qa4XP311dIktaMt5zvHDQPxQ8mzGBMhYn973NRpTmM5WS-XHNjD0KU9yg'
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
 	end
end
