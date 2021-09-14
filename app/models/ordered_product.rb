class OrderedProduct < ApplicationRecord
	belongs_to :order
	belongs_to :scheduled_product
end
