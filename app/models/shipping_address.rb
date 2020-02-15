class ShippingAddress < ApplicationRecord
	belongs_to :end_user

	def zip_code_and_address_and_order_name
		self.zip_code + self.address + self.order_name
	end
end
