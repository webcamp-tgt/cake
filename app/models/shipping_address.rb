class ShippingAddress < ApplicationRecord
	belongs_to :end_user


	validates :zip_code, length: { is: 7 }
	validates :address, presence: true
	validates :order_name, presence: true

	def zip_code_and_address_and_order_name
		self.zip_code + self.address + self.order_name
	end
end
