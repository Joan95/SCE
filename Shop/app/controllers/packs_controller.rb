class PacksController < ApplicationController
	def list
		@packs = Pack.all
	end
end
