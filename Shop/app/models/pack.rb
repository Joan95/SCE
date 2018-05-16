class Pack < ApplicationRecord
	has_many :toys
	has_many :pieces, through: :toys
end
