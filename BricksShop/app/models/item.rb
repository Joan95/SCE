class Item < ApplicationRecord

	def self.defaultList()
		where("category LIKE 'toy'")
	end

	def self.listPacks()
		where("category LIKE 'pack'")
	end

	def self.listToys()
		where("category LIKE 'toy'")
	end

	def self.listPieces()
		where("category LIKE 'piece'")
	end

	def self.searchItem(search)
		where("name LIKE ?", "%#{search}%")
	end

	def self.searchPack(search)
		where("name LIKE ? AND category LIKE 'pack'", "%#{search}%")
	end

	def self.searchToy(search)
		where("name LIKE ? AND category LIKE 'toy'", "%#{search}%")
	end

	def self.searchPiece(search)
		where("name LIKE ? AND category LIKE 'piece'", "%#{search}%")
	end

end
