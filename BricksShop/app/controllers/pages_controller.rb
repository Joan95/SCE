class PagesController < ApplicationController

	def home 
		session[:products] ||= []

		@response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/')
		Rails.logger.debug("My object: #(@response.inspect)")

		@itemsDefaultList = Item.defaultList()
	end
end
