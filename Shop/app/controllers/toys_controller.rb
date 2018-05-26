class ToysController < ApplicationController
	def list
		@toys = Toy.all
	end

	def search
		if params[:search]
			@toys = Toy.search(params[:search])
		else
			@toys = Toy.all
		end
	end

	def show
		@toy = Toy.find(params[:id])
		@pieces = @toy.pieces
	end
	
end
