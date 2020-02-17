class Item < ApplicationRecord

	belongs_to :genre
	has_many :cart_items,dependent: :destroy
	has_many :order_items,dependent: :destroy
	has_many :orders,through: :order_items

	attachment :image

	enum sale_status: {　販売中:0,品切れ:1 }
end
