class Order < ApplicationRecord
	belongs_to :visitor

	has_many :ordered_product
end
