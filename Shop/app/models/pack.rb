class Pack < ApplicationRecord
	has_and_belongs_to_many :toys

	def self.search(search)
		where("name LIKE ?", "%#{search}%")
	end
end
