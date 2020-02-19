class Order < ApplicationRecord
	belongs_to :end_user
	has_many :order_items,dependent: :destroy

	validates :zip_code, length: { is: 7 }
	validates :address, presence: true
	validates :order_name, presence: true

	enum order_status: { 入金待ち:0, 入金確認:1, 製作中発送準備中:3, 発送済み:4 }

	has_many :items,through: :order_items

	def call_count
		Call.count(:id)
	end

	enum payment_method: {クレジットカード: 0, 銀行振込: 1}
end
