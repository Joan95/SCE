class Piece < ApplicationRecord
	has_many :assemblies
	has_many :toys, through: :assemblies
end
