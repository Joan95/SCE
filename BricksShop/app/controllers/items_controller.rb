class ItemsController < ApplicationController
	
	def index
		@items = Item.all
	end 

	def defaultList
		@itemsDefaultList = Item.defaultList()
	end

	def newItem
		@item = Item.new
	end 

	def createItem
		@item = Item.new(items_params)
		if @item.save
			redirect_to '/items'
		else 
			redirect_to('/items/newItem')
		end
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

	private 
		def items_params
			params.require(:item).permit(:name, :price, :image, :description, :category)
		end
end
