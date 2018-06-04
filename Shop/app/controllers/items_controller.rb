class ItemController < ApplicationController
	def defaultList
		@itemsDefaultList = Item.defaultList()
	end 

	def searchPack
		if params[:search]
			@itemsPacks = Item.search(params[:search])
		else
			@itemsPacks = Item.all
		end
	end

	def searchToy

	end

	def searchPiece

	end

	def searchItem
		if params[:search]
			@item = Item.searchItem(params[:search])
		else
			@item = Item.all
		end
	end

	def showItem
		@item = Item.find(params[:id])
	end
end
