class PacksController < ApplicationController
	def list
		@packs = Pack.all
	end

	def search
		if params[:search]
			@packs = Pack.search(params[:search])
		else
			@packs = Pack.all
		end
	end

	def show
		@pack = Pack.find(params[:id])
		@toys = @pack.toys
	end
end
