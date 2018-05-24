class PacksController < ApplicationController
	def list
		@packs = Pack.all
	end

	def show
		@pack = Pack.find(params[:id])
		@toys = @pack.toys
	end
end
