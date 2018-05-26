class Cart < ApplicationRecord

	def initialize(session)
		@session = session
		@session[:cart] ||= {}
	end

	def add_item(item_id)
		@session[:cart][item_id].present? ? @session[:cart][item_id] += 1 : @session[:cart][item_id] = 1
	end

	def remove_item(item_id)
		@session[:cart].delete(item_id)
	end
end
