class PagesController < ApplicationController
	def home
		session[:products] ||= []
	end
end
