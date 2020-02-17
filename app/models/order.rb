class Order < ApplicationRecord
	belongs_to :end_user
	has_many :order_items,dependent: :destroy

	enum order_status: { 入金待ち:0, 入金確認:1, 製作中発送準備中:3, 発送済み:4 }

	has_many :items,through: :order_items

	def call_count
		Call.count(:id)
	end

	def total_price
		order_items.to_a.sum { |item| item.total_price }
	end

	def total
		total_price + shipping_cost
	end
	enum payment_method: {クレジットカード: 0, 銀行振込: 1}
end
