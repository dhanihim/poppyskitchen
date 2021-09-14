class ScheduledProduct < ApplicationRecord
	belongs_to :product
	belongs_to :schedule

	has_many :ordered_product
end
