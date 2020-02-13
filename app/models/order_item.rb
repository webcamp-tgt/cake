class OrderItem < ApplicationRecord
	belongs_to :order
	belongs_to :item

	def total_price
		price_tax * order_quantity
	end
end


