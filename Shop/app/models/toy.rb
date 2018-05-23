class Toy < ApplicationRecord
	has_many :assemblies
	has_many :pieces, through: :assemblies
	has_and_belongs_to_many :packs
end
