class Piece < ApplicationRecord
	has_many :assemblies
	has_many :toys, through: :assemblies

	def self.search(search)
		where("description LIKE ?", "%#{search}%")
	end
end
