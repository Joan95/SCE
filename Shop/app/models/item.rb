class Item < ApplicationRecord

	def self.defaultList()
		where("category LIKE 'toy'")
	end

	def self.searchItem(search)
		where("name LIKE ?", "%#{search}%")
	end
end
