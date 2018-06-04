class PagesController < ApplicationController

	def home 
		session[:products] ||= []

		@itemsDefaultList = Item.defaultList()
	end
end
