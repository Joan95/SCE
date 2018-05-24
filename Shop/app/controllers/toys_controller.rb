class ToysController < ApplicationController
	def list
		@toys = Toy.all
	end
	
	def show
		@toy = Toy.find(params[:id])
		@pieces = @toy.pieces
	end
end
