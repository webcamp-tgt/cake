class Order < ApplicationRecord
	belongs_to :end_user
	has_many :order_items,dependent: :destroy

	def call_count
		Call.count(:id)
	end

	def total_price
		order_items.to_a.sum { |item| item.total_price }
	end

	def total
		total_price + shipping_cost
	end
end
