class Pack < ApplicationRecord
	has_and_belongs_to_many :toys
end
