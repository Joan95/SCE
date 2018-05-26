class PiecesController < ApplicationController
	def list
		@pieces = Piece.all
	end

	def search
		if params[:search]
			@pieces = Piece.search(params[:search])
		else
			@pieces = Piece.all
		end
	end
end
