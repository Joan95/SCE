class ItemsController < ApplicationController
	def defaultList
		@itemsDefaultList = Item.defaultList()
	end 

	def listPacks
		@itemsPacks = Item.listPacks()
	end

	def listToys
		@itemsToys = Item.listToys()
	end

	def listPieces
		@itemsPieces = Item.listPieces()
	end

	def searchPack
		if params[:search]
			@itemsPacks = Item.searchPack(params[:search])
		else
			@itemsPacks = Item.all
		end
	end

	def searchToy
		if params[:search]
			@itemsToys = Item.searchToy(params[:search])
		else
			@itemsToys = Item.all
		end
	end

	def searchPiece
		if params[:search]
			@itemsPieces = Item.searchPiece(params[:search])
		else
			@itemsPieces = Item.all
		end
	end

	def searchItem
		if params[:search]
			@items = Item.searchItem(params[:search])
		else
			@items = Item.all
		end
	end

	def showItem
		@item = Item.find(params[:id])
	end
end
