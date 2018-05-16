class PacksController < ApplicationController
	def index
		@packs = Pack.all
	end
end
