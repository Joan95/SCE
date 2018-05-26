class Order < ApplicationRecord
	has_many :order_items, dependent: :destroy

	scope :recent, -> { order created_at: :desc }

	
end
