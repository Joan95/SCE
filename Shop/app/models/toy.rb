class Toy < ApplicationRecord
	has_many :packs
	belongs_to :piece
end
