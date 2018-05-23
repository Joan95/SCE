class ToysController < ApplicationController
	def list
		@toys = Toy.all
	end
end
