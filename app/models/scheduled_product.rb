class ScheduledProduct < ApplicationRecord
	belongs_to :product
	belongs_to :schedule

	has_many :ordered_product

	def name_with_price
		"#{product.name} - #{product.price}"
	end
end
