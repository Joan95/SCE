class PiecesController < ApplicationController
	def list
		@pieces = Piece.all
	end
end
